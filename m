From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: USB support for device tree
Date: Fri, 4 Nov 2011 23:52:26 -0400
Message-ID: <CACxGe6tgXc0kWnHM1FrbnJO3NU1xdzPaZ2x2ZXCgoG1crEwxcA@mail.gmail.com>
References: <4EB3A165.8060300@codeaurora.org>
 <CACxGe6vMCHdB+J8hX1EPW3m35UaKC-FAZULUA4G11J0FUK6tNQ@mail.gmail.com>
 <4EB424DD.4090609@codeaurora.org>
 <CACxGe6sYkCSnFvybGcjrkh4cNvtjS=t6fr456be4KFDc3Gre2w@mail.gmail.com>
 <4EB4A897.8020305@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1353879706588490646=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4EB4A897.8020305-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Pavan Kondeti <pkondeti-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: "linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

--===============1353879706588490646==
Content-Type: multipart/alternative; boundary=0016e640832efd7ab104b0f4bf2c

--0016e640832efd7ab104b0f4bf2c
Content-Type: text/plain; charset=ISO-8859-1

On Nov 4, 2011 11:08 PM, "Pavan Kondeti" <pkondeti-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>
> Hi
>
> On 11/4/2011 11:42 PM, Grant Likely wrote:
> > It is not legal for two device nodes to have overlapping 'reg' regions
> > (unless one is a child of the other), so by extension it is not okay
> > for two nodes to have the same 'name@addr'.  However, it is perfectly
> > acceptable and encouraged for two nodes at different addresses to
> > start with the same value for 'name@'.  This is called the generic
> > names recommended practice, and it can also be found in the ePAPR
> > documentation on node names.
> >
> > If you want to have both host and device drivers bound to a single
> > device for OTG mode, then you should use a wrapper driver in Linux
> > that binds to the single node and instantiates each of the interfaces
> > as a child device.  For an example take a look at
> > drivers/usb/host/fsl-mph-dr-of.c.
>
> Currently we have two platform devices one for OTG and one for host,
> corresponding drivers for them. If I would like to keep it this way, the
> device tree becomes something like below
>
> hsusb0-otg: usb-otg@0xa6000000 {
>        compatible = "qcom,hsusb-otg";
>        ---
> };
>
> hsusb0-device: usb-gadget@0xa6000000 {
>        compatible = "qcom,hsusb-device";
>        ---
> };
>
> hsusb0-host: usb@0xa6000000 {
>        compatible = "qcom,hsusb-host", "usb-ehci";
>        ---
> };

No, you don't need three nodes. Only one node for the whole thing since
from the hardware perspective it is still a single device. The driver for
that node should create the child otg and gadget platform_devices so that
you can preserve the existing driver structure.

There does not need to be a device tree node for every struct device in the
kernel.

g.

>
> Are you okay with above naming convention?
>
> --
> Sent by a consultant of the Qualcomm Innovation Center, Inc.
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.

--0016e640832efd7ab104b0f4bf2c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p><br>
On Nov 4, 2011 11:08 PM, &quot;Pavan Kondeti&quot; &lt;<a href=3D"mailto:pk=
ondeti-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org">pkondeti-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; On 11/4/2011 11:42 PM, Grant Likely wrote:<br>
&gt; &gt; It is not legal for two device nodes to have overlapping &#39;reg=
&#39; regions<br>
&gt; &gt; (unless one is a child of the other), so by extension it is not o=
kay<br>
&gt; &gt; for two nodes to have the same &#39;name@addr&#39;. =A0However, i=
t is perfectly<br>
&gt; &gt; acceptable and encouraged for two nodes at different addresses to=
<br>
&gt; &gt; start with the same value for &#39;name@&#39;. =A0This is called =
the generic<br>
&gt; &gt; names recommended practice, and it can also be found in the ePAPR=
<br>
&gt; &gt; documentation on node names.<br>
&gt; &gt;<br>
&gt; &gt; If you want to have both host and device drivers bound to a singl=
e<br>
&gt; &gt; device for OTG mode, then you should use a wrapper driver in Linu=
x<br>
&gt; &gt; that binds to the single node and instantiates each of the interf=
aces<br>
&gt; &gt; as a child device. =A0For an example take a look at<br>
&gt; &gt; drivers/usb/host/fsl-mph-dr-of.c.<br>
&gt;<br>
&gt; Currently we have two platform devices one for OTG and one for host,<b=
r>
&gt; corresponding drivers for them. If I would like to keep it this way, t=
he<br>
&gt; device tree becomes something like below<br>
&gt;<br>
&gt; hsusb0-otg: usb-otg@0xa6000000 {<br>
&gt; =A0 =A0 =A0 =A0compatible =3D &quot;qcom,hsusb-otg&quot;;<br>
&gt; =A0 =A0 =A0 =A0---<br>
&gt; };<br>
&gt;<br>
&gt; hsusb0-device: usb-gadget@0xa6000000 {<br>
&gt; =A0 =A0 =A0 =A0compatible =3D &quot;qcom,hsusb-device&quot;;<br>
&gt; =A0 =A0 =A0 =A0---<br>
&gt; };<br>
&gt;<br>
&gt; hsusb0-host: usb@0xa6000000 {<br>
&gt; =A0 =A0 =A0 =A0compatible =3D &quot;qcom,hsusb-host&quot;, &quot;usb-e=
hci&quot;;<br>
&gt; =A0 =A0 =A0 =A0---<br>
&gt; };</p>
<p>No, you don&#39;t need three nodes. Only one node for the whole thing si=
nce from the hardware perspective it is still a single device. The driver f=
or that node should create the child otg and gadget platform_devices so tha=
t you can preserve the existing driver structure.</p>

<p>There does not need to be a device tree node for every struct device in =
the kernel.</p>
<p>g.</p>
<p>&gt;<br>
&gt; Are you okay with above naming convention?<br>
&gt;<br>
&gt; --<br>
&gt; Sent by a consultant of the Qualcomm Innovation Center, Inc.<br>
&gt; The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Fo=
rum.<br>
</p>

--0016e640832efd7ab104b0f4bf2c--

--===============1353879706588490646==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1353879706588490646==--
