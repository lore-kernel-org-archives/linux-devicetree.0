From: Yinbo Zhu <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
Subject: RE: [PATCH v2] arm64: dts: ls1088a: Add USB support
Date: Wed, 20 Dec 2017 04:42:59 +0000
Message-ID: <HE1PR0401MB19451C3CFAA694F965B30F0FE90C0@HE1PR0401MB1945.eurprd04.prod.outlook.com>
References: <20170913091009.21448-1-yinbo.zhu@nxp.com>
 <20170922065454.GF26358@dragon>
 <VI1PR04MB1262D160BA8625330E32CAF9E9470@VI1PR04MB1262.eurprd04.prod.outlook.com>
 <AM3PR04MB12515DB71B8ACF7422A20244E9280@AM3PR04MB1251.eurprd04.prod.outlook.com>
 <VI1PR04MB1262DD3C6A18257DEE2E907DE9200@VI1PR04MB1262.eurprd04.prod.outlook.com>
 <VI1PR04MB1262C44016CE4ECB8902E7E7E9330@VI1PR04MB1262.eurprd04.prod.outlook.com>
 <20171220025239.GB3766@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171220025239.GB3766@dragon>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "Catalin Marinas )" <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "Will Deacon )" <will.deacon-5wv7dgnIgG8@public.gmane.org>, Harninder Rai <harninder.rai-3arQi8VN3Tc@public.gmane.org>, Raghav Dogra <raghav.dogra-3arQi8VN3Tc@public.gmane.org>, Ashish Kumar <ashish.kumar-3arQi8VN3Tc@public.gmane.org>, Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ran Wang <ran.wang_1-3arQi8VN3Tc@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org



-----Original Message-----
From: Shawn Guo [mailto:shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]=20
Sent: Wednesday, December 20, 2017 10:53 AM
To: Yinbo Zhu <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>; =
Catalin Marinas ) <catalin.marinas-5wv7dgnIgG8@public.gmane.org>; Will Deacon ) <will.deacon@arm=
.com>; Harninder Rai <harninder.rai-3arQi8VN3Tc@public.gmane.org>; Raghav Dogra <raghav.dogra@nx=
p.com>; Ashish Kumar <ashish.kumar-3arQi8VN3Tc@public.gmane.org>; Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>;=
 open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vge=
r.kernel.org>; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; open list <linux-kerne=
l@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ls1088a: Add USB support

On Thu, Dec 07, 2017 at 07:33:28AM +0000, Yinbo Zhu wrote:
> Hi shawn guo,
>=20
> If my patch has no other issue,
> Can you help me push it to upstream.

>Are you talking about v4 patch?  First of all, I cannot find v4 in my mail=
box.  That said, it seems you did not send=20

>the patch to me.
>Secondly, by checking the patch on patchwork, the usb nodes in fsl-ls1088a=
-rdb.dts do not sorted alphabetically=20

>in label name.

>Shawn

Hi shawn,=20
 I will change the code as follows, right?

&esdhc {
 	status =3D "okay";
 };
...
+&usb0 {
+	status =3D "okay";
+};
+
+&usb1 {
+	status =3D "okay";
+};
+
https://patchwork.kernel.org/patch/10059097/

Thanks
Yinbo.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
