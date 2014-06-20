Return-Path: <m-karicheri2@ti.com>
Message-ID: <53A46963.5040305@ti.com>
Date: Fri, 20 Jun 2014 13:03:31 -0400
From: Murali Karicheri <m-karicheri2@ti.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/8] Add Keystone PCIe controller driver
References: <1402426287-31157-1-git-send-email-m-karicheri2@ti.com> <2CC2A0A4A178534D93D5159BF3BCB6619C5F8169D1@EAPEX1MAIL1.st.com>
In-Reply-To: <2CC2A0A4A178534D93D5159BF3BCB6619C5F8169D1@EAPEX1MAIL1.st.com>
Content-Type: multipart/alternative;
	boundary="------------080103060405040804090805"
To: Mohit KUMAR DCG <Mohit.KUMAR@st.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Pratyush ANAND <pratyush.anand@st.com>, "Shilimkar, Santosh" <santosh.shilimkar@ti.com>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jingoo Han <jg1.han@samsung.com>, Bjorn Helgaas <bhelgaas@google.com>, Richard Zhu <r65037@freescale.com>, "ABRAHAM, KISHON VIJAY  <kishon@ti.com>, Marek Vasut <marex@denx.de>, Arnd Bergmann" <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>
List-ID: <devicetree@vger.kernel.org>

--------------080103060405040804090805
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/18/2014 6:14 AM, Mohit KUMAR DCG wrote:
> Hello Murali,
>
>> -----Original Message-----
>> From: Murali Karicheri [mailto:m-karicheri2@ti.com]
>> Sent: Wednesday, June 11, 2014 12:21 AM
>> To: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
>> linux-pci@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> doc@vger.kernel.org
>> Cc: Murali Karicheri; Santosh Shilimkar; Russell King; Grant Likely; Rob Herring;
>> Mohit KUMAR DCG; Jingoo Han; Bjorn Helgaas; Pratyush ANAND; Richard
>> Zhu; Kishon Vijay Abraham I; Marek Vasut; Arnd Bergmann; Pawel Moll;
>> Mark Rutland; Ian Campbell; Kumar Gala; Randy Dunlap
>> Subject: [PATCH v2 0/8] Add Keystone PCIe controller driver
>>
>> This patch adds a PCIe controller driver for Keystone SoCs. This is based on v1
>> of the series posted to the mailing list.
>>
> 1. I think your first patch is OK which handles platform specific ATU implementation.
>
> 2. For MSI part, I think you just need to add two new callbacks with pp-ops, something similar to:
> pp->ops->msi_set
>
> pp->ops->msi_clear
>
> With these two platform specific callbacks you should be able to manage MSI handling.
> So idea is that dw_msi code uses pp->ops->msi_set/clear if platform define these,
> otherwise use dw_msi_set/clear (which you need to refactor from existing code)
>
> So other than your keystone changes we expect 3 patches:
> --  1st same as you sent 1/8: for ATU handeling
> -- 2nd to refactor dw_msi_set/clear: refactor from existing code
Mohit,

Thanks for your comments.

Just want to be on the same page

1. In my original patch [PATCH v2 3/8] PCI: designware: update pcie core 
driver to work with dw hw version 3.65.
  I had following changes:-

diff --git a/drivers/pci/host/pcie-designware.c 
b/drivers/pci/host/pcie-designware.c

index e4bd19a..f985811 100644

--- a/drivers/pci/host/pcie-designware.c

+++ b/drivers/pci/host/pcie-designware.c

@@ -277,11 +277,15 @@ static int assign_irq(int no_irqs, struct msi_desc 
*desc, int *pos)

}

set_bit(pos0 + i, pp->msi_irq_in_use);

/*Enable corresponding interrupt in MSI interrupt controller */

-res = ((pos0 + i) / 32) * 12;

-bit = (pos0 + i) % 32;

-dw_pcie_rd_own_conf(pp, PCIE_MSI_INTR0_ENABLE + res, 4, &val);

-val |= 1 << bit;

-dw_pcie_wr_own_conf(pp, PCIE_MSI_INTR0_ENABLE + res, 4, val);

+if (!(pp->version & DW_V3_65)) {

+res = ((pos0 + i) / 32) * 12;

+bit = (pos0 + i) % 32;

+dw_pcie_rd_own_conf(pp, PCIE_MSI_INTR0_ENABLE + res,

+4, &val);

+val |= 1 << bit;

+dw_pcie_wr_own_conf(pp, PCIE_MSI_INTR0_ENABLE + res,

+4, val);

+}

}


I assume you are referring to the above code for msi_set().  I missed to 
add similar code change to clear_irq().

So in assign_irq()

             if (pp->ops->msi_set)
                        pp->ops->msi_set()

Similarly in clear_irq()

             if (pp->ops->msi_clear)
                         pp->ops->msi_clear()


*pos = pos0;

@@ -349,7 +353,10 @@ static int dw_msi_setup_irq(struct msi_chip *chip, 
struct pci_dev *pdev,

*/

desc->msi_attrib.multiple = msgvec;

-msg.address_lo = virt_to_phys((void *)pp->msi_data);

+if (pp->ops->get_msi_data)

+msg.address_lo = pp->ops->get_msi_data(pp);

+else

+msg.address_lo = virt_to_phys((void *)pp->msi_data);

msg.address_hi = 0x0;

msg.data = pos;


What about this code? This requires get_msi_data() as well

> -- 3rd to use pp->ops->msi_set/clear if defined.
Why not API enhancement and refactor the code in a single patch?

Murali
>
> Pls let us know for any issue or have different opinion.
>
> Regards
> Mohit
>
>
>
>   
>> --
>> 1.7.9.5


--------------080103060405040804090805
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 6/18/2014 6:14 AM, Mohit KUMAR DCG
      wrote:<br>
    </div>
    <blockquote
      cite="mid:2CC2A0A4A178534D93D5159BF3BCB6619C5F8169D1@EAPEX1MAIL1.st.com"
      type="cite">
      <pre wrap="">Hello Murali,

</pre>
      <blockquote type="cite">
        <pre wrap="">-----Original Message-----
From: Murali Karicheri [<a class="moz-txt-link-freetext" href="mailto:m-karicheri2@ti.com">mailto:m-karicheri2@ti.com</a>]
Sent: Wednesday, June 11, 2014 12:21 AM
To: <a class="moz-txt-link-abbreviated" href="mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@lists.infradead.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:linux-kernel@vger.kernel.org">linux-kernel@vger.kernel.org</a>;
<a class="moz-txt-link-abbreviated" href="mailto:linux-pci@vger.kernel.org">linux-pci@vger.kernel.org</a>; <a class="moz-txt-link-abbreviated" href="mailto:devicetree@vger.kernel.org">devicetree@vger.kernel.org</a>; linux-
<a class="moz-txt-link-abbreviated" href="mailto:doc@vger.kernel.org">doc@vger.kernel.org</a>
Cc: Murali Karicheri; Santosh Shilimkar; Russell King; Grant Likely; Rob Herring;
Mohit KUMAR DCG; Jingoo Han; Bjorn Helgaas; Pratyush ANAND; Richard
Zhu; Kishon Vijay Abraham I; Marek Vasut; Arnd Bergmann; Pawel Moll;
Mark Rutland; Ian Campbell; Kumar Gala; Randy Dunlap
Subject: [PATCH v2 0/8] Add Keystone PCIe controller driver

This patch adds a PCIe controller driver for Keystone SoCs. This is based on v1
of the series posted to the mailing list.

</pre>
      </blockquote>
      <pre wrap="">
1. I think your first patch is OK which handles platform specific ATU implementation.

2. For MSI part, I think you just need to add two new callbacks with pp-ops, something similar to:
pp-&gt;ops-&gt;msi_set

pp-&gt;ops-&gt;msi_clear

With these two platform specific callbacks you should be able to manage MSI handling.
So idea is that dw_msi code uses pp-&gt;ops-&gt;msi_set/clear if platform define these,
otherwise use dw_msi_set/clear (which you need to refactor from existing code)

So other than your keystone changes we expect 3 patches:
--  1st same as you sent 1/8: for ATU handeling
-- 2nd to refactor dw_msi_set/clear: refactor from existing code</pre>
    </blockquote>
    Mohit,<br>
    <br>
    Thanks for your comments.<br>
    <br>
    Just want to be on the same page<br>
    <br>
    1. In my original patch [PATCH v2 3/8] PCI: designware: update pcie
    core driver to work with dw hw version 3.65.<br>
    �I had following changes:-<br>
    <br>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
    <p class="MsoPlainText">diff --git
      a/drivers/pci/host/pcie-designware.c
      b/drivers/pci/host/pcie-designware.c</p>
    <p class="MsoPlainText">index e4bd19a..f985811 100644</p>
    <p class="MsoPlainText">--- a/drivers/pci/host/pcie-designware.c</p>
    <p class="MsoPlainText">+++ b/drivers/pci/host/pcie-designware.c</p>
    <p class="MsoPlainText">@@ -277,11 +277,15 @@ static int
      assign_irq(int no_irqs,
      struct msi_desc *desc, int *pos)</p>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">�</span><span
        style="mso-tab-count:2">�������������� </span>}</p>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">�</span><span
        style="mso-tab-count:2">�������������� </span>set_bit(pos0 + i,
      pp-&gt;msi_irq_in_use);</p>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">�</span><span
        style="mso-tab-count:2">�������������� </span>/*Enable
      corresponding interrupt
      in MSI interrupt controller */</p>
    <p class="MsoPlainText">-<span style="mso-tab-count:2">��������������
      </span>res
      = ((pos0 + i) / 32) * 12;</p>
    <p class="MsoPlainText">-<span style="mso-tab-count:2">��������������
      </span>bit
      = (pos0 + i) % 32;</p>
    <p class="MsoPlainText">-<span style="mso-tab-count:2">��������������
      </span>dw_pcie_rd_own_conf(pp,
      PCIE_MSI_INTR0_ENABLE + res, 4, &amp;val);</p>
    <p class="MsoPlainText">-<span style="mso-tab-count:2">��������������
      </span>val
      |= 1 &lt;&lt; bit;</p>
    <p class="MsoPlainText">-<span style="mso-tab-count:2">��������������
      </span>dw_pcie_wr_own_conf(pp,
      PCIE_MSI_INTR0_ENABLE + res, 4, val);</p>
    <p class="MsoPlainText">+<span style="mso-tab-count:2">�������������
      </span>if
      (!(pp-&gt;version &amp; DW_V3_65)) {</p>
    <p class="MsoPlainText">+<span style="mso-tab-count:3">���������������������
      </span>res
      = ((pos0 + i) / 32) * 12;</p>
    <p class="MsoPlainText">+<span style="mso-tab-count:3">���������������������
      </span>bit
      = (pos0 + i) % 32;</p>
    <p class="MsoPlainText">+<span style="mso-tab-count:3">���������������������
      </span>dw_pcie_rd_own_conf(pp,
      PCIE_MSI_INTR0_ENABLE + res,</p>
    <p class="MsoPlainText">+<span style="mso-tab-count:5">�������������������������������������
      </span><span style="mso-spacerun:yes">��� </span>4, &amp;val);</p>
    <p class="MsoPlainText">+<span style="mso-tab-count:3">���������������������
      </span>val
      |= 1 &lt;&lt; bit;</p>
    <p class="MsoPlainText">+<span style="mso-tab-count:3">���������������������
      </span>dw_pcie_wr_own_conf(pp,
      PCIE_MSI_INTR0_ENABLE + res,</p>
    <p class="MsoPlainText">+<span style="mso-tab-count:5">�������������������������������������
      </span><span style="mso-spacerun:yes">��� </span>4, val);</p>
    <p class="MsoPlainText">+<span style="mso-tab-count:2">�������������
      </span>}</p>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">�</span><span
        style="mso-tab-count:1">������ </span>}</p>
    <br>
    I assume you are referring to the above code for msi_set().� I
    missed to add similar code change to clear_irq(). <br>
    <br>
    So in assign_irq()<br>
    <br>
    �� ��� ���� if (pp-&gt;ops-&gt;msi_set)<br>
    ��� ��� ��� ��� ��� �� pp-&gt;ops-&gt;msi_set()<br>
    <br>
    Similarly in clear_irq()<br>
    <br>
    ��� ��� ��� if (pp-&gt;ops-&gt;msi_clear)<br>
    ��� ��� ��� ��� ��� ��� pp-&gt;ops-&gt;msi_clear()<br>
    <br>
    <br>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">�</span><span
        style="mso-tab-count:1">������ </span>*pos = pos0;</p>
    <p class="MsoPlainText">@@ -349,7 +353,10 @@ static int
      dw_msi_setup_irq(struct
      msi_chip *chip, struct pci_dev *pdev,</p>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">�</span><span
        style="mso-tab-count:1">������ </span><span
        style="mso-spacerun:yes">�</span>*/</p>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">�</span><span
        style="mso-tab-count:1">������ </span>desc-&gt;msi_attrib.multiple
      = msgvec;</p>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">�</span></p>
    <p class="MsoPlainText">-<span style="mso-tab-count:1">������ </span>msg.address_lo
=
      virt_to_phys((void *)pp-&gt;msi_data);</p>
    <p class="MsoPlainText">+<span style="mso-tab-count:1">����� </span>if
      (pp-&gt;ops-&gt;get_msi_data)</p>
    <p class="MsoPlainText">+<span style="mso-tab-count:2">�������������
      </span>msg.address_lo
      = pp-&gt;ops-&gt;get_msi_data(pp);</p>
    <p class="MsoPlainText">+<span style="mso-tab-count:1">����� </span>else</p>
    <p class="MsoPlainText">+<span style="mso-tab-count:2">�������������
      </span>msg.address_lo
      = virt_to_phys((void *)pp-&gt;msi_data);</p>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">�</span><span
        style="mso-tab-count:1">������ </span>msg.address_hi = 0x0;</p>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">�</span><span
        style="mso-tab-count:1">������ </span>msg.data = pos;</p>
    <br>
    What about this code? This requires get_msi_data() as well<br>
    <meta name="ProgId" content="Word.Document">
    <meta name="Generator" content="Microsoft Word 12">
    <meta name="Originator" content="Microsoft Word 12">
    <link rel="File-List"
href="file:///C:%5CUsers%5Ca0868495%5CAppData%5CLocal%5CTemp%5Cmsohtmlclip1%5C01%5Cclip_filelist.xml">
    <link rel="themeData"
href="file:///C:%5CUsers%5Ca0868495%5CAppData%5CLocal%5CTemp%5Cmsohtmlclip1%5C01%5Cclip_themedata.thmx">
    <link rel="colorSchemeMapping"
href="file:///C:%5CUsers%5Ca0868495%5CAppData%5CLocal%5CTemp%5Cmsohtmlclip1%5C01%5Cclip_colorschememapping.xml">
    <!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:DontVertAlignCellWithSp/>
   <w:DontBreakConstrainedForcedTables/>
   <w:DontVertAlignInTxbx/>
   <w:Word11KerningPairs/>
   <w:CachedColBalance/>
  </w:Compatibility>
  <w:DoNotOptimizeForBrowser/>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="true"
  DefSemiHidden="true" DefQFormat="false" DefPriority="99"
  LatentStyleCount="267">
  <w:LsdException Locked="false" Priority="0" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" Name="toc 9"/>
  <w:LsdException Locked="false" Priority="35" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" Priority="10" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" Priority="1" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" Priority="11" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" Priority="22" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" Priority="59" SemiHidden="false"
   UnhideWhenUsed="false" Name="Table Grid"/>
  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" UnhideWhenUsed="false" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" SemiHidden="false"
   UnhideWhenUsed="false" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" SemiHidden="false"
   UnhideWhenUsed="false" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" SemiHidden="false"
   UnhideWhenUsed="false" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" SemiHidden="false"
   UnhideWhenUsed="false" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" SemiHidden="false"
   UnhideWhenUsed="false" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" QFormat="true" Name="TOC Heading"/>
 </w:LatentStyles>
</xml><![endif]-->
    <style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;
	mso-font-charset:1;
	mso-generic-font-family:roman;
	mso-font-format:other;
	mso-font-pitch:variable;
	mso-font-signature:0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-520092929 1073786111 9 0 415 0;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;
	mso-font-charset:0;
	mso-generic-font-family:swiss;
	mso-font-pitch:variable;
	mso-font-signature:-1593833729 1073750107 16 0 415 0;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;
	mso-font-charset:0;
	mso-generic-font-family:modern;
	mso-font-pitch:fixed;
	mso-font-signature:-520092929 1073806591 9 0 415 0;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{mso-style-unhide:no;
	mso-style-qformat:yes;
	mso-style-parent:"";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	mso-bidi-font-size:10.5pt;
	font-family:"Verdana","sans-serif";
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-bidi-font-family:Consolas;
	color:black;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-unhide:no;
	mso-style-locked:yes;
	mso-style-link:"Plain Text";
	mso-ansi-font-size:12.0pt;
	mso-bidi-font-size:10.5pt;
	font-family:"Verdana","sans-serif";
	mso-ascii-font-family:Verdana;
	mso-hansi-font-family:Verdana;
	mso-bidi-font-family:Consolas;
	color:black;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-default-props:yes;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:Calibri;
	mso-fareast-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-paper-source:0;}
div.WordSection1
	{page:WordSection1;}
-->
</style><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-qformat:yes;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-para-margin-bottom:.0001pt;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-fareast-font-family:"Times New Roman";
	mso-fareast-theme-font:minor-fareast;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;}
</style>
<![endif]--><br>
    <blockquote
      cite="mid:2CC2A0A4A178534D93D5159BF3BCB6619C5F8169D1@EAPEX1MAIL1.st.com"
      type="cite">
      <pre wrap="">
-- 3rd to use pp-&gt;ops-&gt;msi_set/clear if defined.</pre>
    </blockquote>
    Why not API enhancement and refactor the code in a single patch? <br>
    <br>
    Murali<br>
    <blockquote
      cite="mid:2CC2A0A4A178534D93D5159BF3BCB6619C5F8169D1@EAPEX1MAIL1.st.com"
      type="cite">
      <pre wrap="">

Pls let us know for any issue or have different opinion.

Regards
Mohit



 
</pre>
      <blockquote type="cite">
        <pre wrap="">
--
1.7.9.5
</pre>
      </blockquote>
      <pre wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------080103060405040804090805--
