Return-Path: <rob.rice@broadcom.com>
MIME-Version: 1.0
In-Reply-To: <576017C7.50609@arm.com>
References: <1465912965-35500-1-git-send-email-rob.rice@broadcom.com>
	<1465912965-35500-2-git-send-email-rob.rice@broadcom.com>
	<576017C7.50609@arm.com>
Date: Thu, 16 Jun 2016 09:50:23 -0400
Message-ID: <CAG4BRpnP_qqffLF9X+RusNQGnrtARap9HmK4RE4_jSVfO5juGQ@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/3] dt-bindings: add bindings documentation for
 PDC driver.
From: Rob Rice <rob.rice@broadcom.com>
Content-Type: multipart/alternative; boundary=001a113f231c0716e80535658533
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, BCM Kernel Feedback <bcm-kernel-feedback-list@broadcom.com>, linux-kernel@vger.kernel.org, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Jon Mason <jonmason@broadcom.com>, Florian Fainelli <f.fainelli@gmail.com>, Anup Patel <anup.patel@broadcom.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Rob Rice <rrice@broadcom.com>
List-ID: <devicetree@vger.kernel.org>

--001a113f231c0716e80535658533
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 14, 2016 at 10:42 AM, Sudeep Holla <sudeep.holla@arm.com> wrote:

>
>
> On 14/06/16 15:02, Rob Rice wrote:
>
>> From: Rob Rice <rrice@broadcom.com>
>>
>> Add the device tree binding documentation for the PDC hardware
>> in Broadcom iProc SoCs.
>>
>> Signed-off-by: Rob Rice <rob.rice@broadcom.com>
>> Acked-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Ray Jui <ray.jui@broadcom.com>
>> Reviewed-by: Anup Patel <anup.patel@broadcom.com>
>> Reviewed-by: Scott Branden <scott.branden@broadcom.com>
>> ---
>>   .../bindings/mailbox/brcm,iproc-pdc-mbox.txt       | 23
>> ++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>   create mode 100644
>> Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
>>
>> diff --git
>> a/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
>> b/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
>> new file mode 100644
>> index 0000000..411ccf4
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt
>> @@ -0,0 +1,23 @@
>> +The PDC driver manages data transfer to and from various offload engines
>> +on some Broadcom SoCs. An SoC may have multiple PDC hardware blocks.
>> There is
>> +one device tree entry per block.
>> +
>> +Required properties:
>> +- compatible : Should be "brcm,iproc-pdc-mbox".
>> +- reg: Should contain PDC registers location and length.
>> +- interrupts: Should contain the IRQ line for the PDC.
>> +- #mbox-cells: 1
>> +- brcm,rx-status-len: Length of metadata preceding received frames, in
>> bytes.
>> +
>>
>
> Ideally the metadata is more associated with the software protocol built
> on top of the mailbox controller.
>
> Is this metadata added by the hardware ?
>
> Otherwise it's better to make it part of the protocol rather than the
> associating with the controller.
>

Yes, in fact this metadata is added by the PDC hardware itself. So it seems
correct for the DT property to be on the controller. (There can be other
metadata associated with the specific protocol (e.g., crypto engine), but
that is accounted for elsewhere.)


> +Optional properties:
>> +- brcm,use-bcm-hdr:  present if a BCM header precedes each frame.
>> +
>>
>
> Same here.


Same answer.

>
>
> --
> Regards,
> Sudeep
>

--001a113f231c0716e80535658533
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Jun 14, 2016 at 10:42 AM, Sudeep Holla <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:sudeep.holla@arm.com" target=3D"_blank">sudeep.holla@arm.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex"><br>
<br>
On 14/06/16 15:02, Rob Rice wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
From: Rob Rice &lt;<a href=3D"mailto:rrice@broadcom.com" target=3D"_blank">=
rrice@broadcom.com</a>&gt;<br>
<br>
Add the device tree binding documentation for the PDC hardware<br>
in Broadcom iProc SoCs.<br>
<br>
Signed-off-by: Rob Rice &lt;<a href=3D"mailto:rob.rice@broadcom.com" target=
=3D"_blank">rob.rice@broadcom.com</a>&gt;<br>
Acked-by: Rob Herring &lt;<a href=3D"mailto:robh@kernel.org" target=3D"_bla=
nk">robh@kernel.org</a>&gt;<br>
Reviewed-by: Ray Jui &lt;<a href=3D"mailto:ray.jui@broadcom.com" target=3D"=
_blank">ray.jui@broadcom.com</a>&gt;<br>
Reviewed-by: Anup Patel &lt;<a href=3D"mailto:anup.patel@broadcom.com" targ=
et=3D"_blank">anup.patel@broadcom.com</a>&gt;<br>
Reviewed-by: Scott Branden &lt;<a href=3D"mailto:scott.branden@broadcom.com=
" target=3D"_blank">scott.branden@broadcom.com</a>&gt;<br>
---<br>
=C2=A0 .../bindings/mailbox/brcm,iproc-pdc-mbox.txt=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 23 ++++++++++++++++++++++<br>
=C2=A0 1 file changed, 23 insertions(+)<br>
=C2=A0 create mode 100644 Documentation/devicetree/bindings/mailbox/brcm,ip=
roc-pdc-mbox.txt<br>
<br>
diff --git a/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.=
txt b/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt<br>
new file mode 100644<br>
index 0000000..411ccf4<br>
--- /dev/null<br>
+++ b/Documentation/devicetree/bindings/mailbox/brcm,iproc-pdc-mbox.txt<br>
@@ -0,0 +1,23 @@<br>
+The PDC driver manages data transfer to and from various offload engines<b=
r>
+on some Broadcom SoCs. An SoC may have multiple PDC hardware blocks. There=
 is<br>
+one device tree entry per block.<br>
+<br>
+Required properties:<br>
+- compatible : Should be &quot;brcm,iproc-pdc-mbox&quot;.<br>
+- reg: Should contain PDC registers location and length.<br>
+- interrupts: Should contain the IRQ line for the PDC.<br>
+- #mbox-cells: 1<br>
+- brcm,rx-status-len: Length of metadata preceding received frames, in byt=
es.<br>
+<br>
</blockquote>
<br>
Ideally the metadata is more associated with the software protocol built<br=
>
on top of the mailbox controller.<br>
<br>
Is this metadata added by the hardware ?<br>
<br>
Otherwise it&#39;s better to make it part of the protocol rather than the<b=
r>
associating with the controller.<br></blockquote><div><br></div><div><span =
style=3D"font-size:12.8px">Yes, in fact this metadata is added by the PDC h=
ardware itself. So it seems correct for the DT property to be on the contro=
ller. (There can be other metadata associated with the specific protocol (e=
.g., crypto engine), but that is accounted for elsewhere.)</span></div><div=
><span style=3D"font-size:12.8px"><br></span></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-le=
ft-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
+Optional properties:<br>
+- brcm,use-bcm-hdr:=C2=A0 present if a BCM header precedes each frame.<br>
+<br>
</blockquote>
<br>
Same here.</blockquote><div><br></div><div>Same answer.=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wid=
th:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-l=
eft:1ex"><span class=3D""><font color=3D"#888888"><br>
<br>
-- <br>
Regards,<br>
Sudeep<br>
</font></span></blockquote></div><br></div></div>

--001a113f231c0716e80535658533--
