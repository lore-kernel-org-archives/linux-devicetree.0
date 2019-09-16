Return-Path: <SRS0=HJFL=XL=linux.intel.com=eswara.kota@kernel.org>
Subject: Re: [PATCH v3 2/2] dwc: PCI: intel: Intel PCIe RC controller driver
References: <20190906112044.GF9720@e119886-lin.cambridge.arm.com>
 <959a5f9b-2646-96e3-6a0f-0af1051ae1cb@linux.intel.com>
 <20190909083117.GH9720@e119886-lin.cambridge.arm.com>
 <22857835-1f98-b251-c94b-16b4b0a6dba2@linux.intel.com>
 <20190911103058.GP9720@e119886-lin.cambridge.arm.com>
 <aefd143c-66d2-b303-d992-a55f75a91b2e@linux.intel.com>
 <20190912082517.GA9720@e119886-lin.cambridge.arm.com>
 <cd73e351-5633-bfa8-a4dc-77357d917a0b@linux.intel.com>
 <DM6PR12MB4010AEA876F20E25FFFE06BDDAB00@DM6PR12MB4010.namprd12.prod.outlook.com>
 <b7a1b955-4c3e-6ffe-ec6a-04afe33e70cd@linux.intel.com>
 <20190913101203.GE2680@smile.fi.intel.com>
From: Dilip Kota <eswara.kota@linux.intel.com>
Message-ID: <026274f8-9bb6-58f1-ea55-14957c05200f@linux.intel.com>
Date: Mon, 16 Sep 2019 10:48:20 +0800
MIME-Version: 1.0
In-Reply-To: <20190913101203.GE2680@smile.fi.intel.com>
Content-Type: multipart/alternative;
 boundary="------------7F064FC03D27DD71052BF637"
Content-Language: en-US
To: "andriy.shevchenko@intel.com" <andriy.shevchenko@intel.com>
Cc: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, Andrew Murray <andrew.murray@arm.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>, "robh@kernel.org" <robh@kernel.org>, "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "hch@infradead.org" <hch@infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "cheol.yong.kim@intel.com" <cheol.yong.kim@intel.com>, "chuanhua.lei@linux.intel.com" <chuanhua.lei@linux.intel.com>, "qi-ming.wu@intel.com" <qi-ming.wu@intel.com>
List-ID: <devicetree@vger.kernel.org>

This is a multi-part message in MIME format.
--------------7F064FC03D27DD71052BF637
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/13/2019 6:12 PM, andriy.shevchenko@intel.com wrote:
> On Fri, Sep 13, 2019 at 05:20:26PM +0800, Dilip Kota wrote:
>> On 9/12/2019 6:49 PM, Gustavo Pimentel wrote:
>>> On Thu, Sep 12, 2019 at 10:23:31, Dilip Kota
>>> <eswara.kota@linux.intel.com> wrote:
>>> Hi, I just return from parental leave, therefore I still trying to get
>>> the pace in mailing list discussion.
>>>
>>> However your suggestion looks good, I agree that can go into DesignWare
>>> driver to be available to all.
>> Thanks Gustavo for the confirmation, i will add it in the next patch version
>>> Just a small request, please do in general:
>>> s/designware/DesignWare
>> Sorry, i didnt understand this.
> It means the reviewer asks you to name DesignWare in this form,
> i.o.w. designware -> DesignWare.
>
> `man 1 sed` gives you more about it :-)
Thanks Andy for clarifying it.
Could you please also let me know your opinion on the driver naming. 
Below is the mail snippet.
======
> Add support to PCIe RC controller on Intel Universal
> Gateway SoC. PCIe controller is based of Synopsys
> Designware pci core.
> +config PCIE_INTEL_AXI
[Andy]: I think that name here is too generic. Classical x86 seems not 
using this.

[Dilip Kota]:
This PCIe driver is for the Intel Gateway SoCs. So how about naming it 
is as
"pcie-intel-gw"; pcie-intel-gw.c and Kconfig as PCIE_INTEL_GW.

Andrew Murray is ok with this naming, please let me know your view.

=====

Regards,
Dilip

>

--------------7F064FC03D27DD71052BF637
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/13/2019 6:12 PM,
      <a class="moz-txt-link-abbreviated" href="mailto:andriy.shevchenko@intel.com">andriy.shevchenko@intel.com</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190913101203.GE2680@smile.fi.intel.com">
      <pre class="moz-quote-pre" wrap="">On Fri, Sep 13, 2019 at 05:20:26PM +0800, Dilip Kota wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On 9/12/2019 6:49 PM, Gustavo Pimentel wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Thu, Sep 12, 2019 at 10:23:31, Dilip Kota
<a class="moz-txt-link-rfc2396E" href="mailto:eswara.kota@linux.intel.com">&lt;eswara.kota@linux.intel.com&gt;</a> wrote:
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi, I just return from parental leave, therefore I still trying to get
the pace in mailing list discussion.

However your suggestion looks good, I agree that can go into DesignWare
driver to be available to all.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Thanks Gustavo for the confirmation, i will add it in the next patch version
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
Just a small request, please do in general:
s/designware/DesignWare
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Sorry, i didnt understand this.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
It means the reviewer asks you to name DesignWare in this form,
i.o.w. designware -&gt; DesignWare.

`man 1 sed` gives you more about it :-)</pre>
    </blockquote>
    Thanks Andy for clarifying it.<br>
    Could you please also let me know your opinion on the driver naming.
    Below is the mail snippet.<br>
    ======<br>
    <blockquote type="cite" style="color: #000000;">Add support to PCIe
      RC controller on Intel Universal
      <br>
      Gateway SoC. PCIe controller is based of Synopsys
      <br>
      Designware pci core.
      <br>
      +config PCIE_INTEL_AXI
      <br>
    </blockquote>
    [Andy]: I think that name here is too generic. Classical x86 seems
    not using this.
    <br>
    <br>
    [Dilip Kota]:<br>
    This PCIe driver is for the Intel Gateway SoCs. So how about naming
    it is as
    <br>
    "pcie-intel-gw"; pcie-intel-gw.c and Kconfig as PCIE_INTEL_GW.
    <br>
    <br>
    Andrew Murray is ok with this naming, please let me know your view.
    <p>=====</p>
    <p>Regards,<br>
      Dilip<br>
    </p>
    <blockquote type="cite"
      cite="mid:20190913101203.GE2680@smile.fi.intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
  </body>
</html>

--------------7F064FC03D27DD71052BF637--
