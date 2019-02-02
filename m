Return-Path: <SRS0=OzpC=QJ=nxp.com=yangbo.lu@kernel.org>
From: "Y.b. Lu" <yangbo.lu@nxp.com>
Subject: Re: [PATCH 0/9] Add ENETC PTP clock driver
Date: Sat, 2 Feb 2019 03:18:41 +0000
Message-ID: 
 <VI1PR0401MB22376A78ECB73FE08676629CF8930@VI1PR0401MB2237.eurprd04.prod.outlook.com>
References: <20190131023310.9563-1-yangbo.lu@nxp.com>
	<20190201.151702.1371937989366446994.davem@davemloft.net>,<20190201.152306.2005700588823816930.davem@davemloft.net>
In-Reply-To: <20190201.152306.2005700588823816930.davem@davemloft.net>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_VI1PR0401MB22376A78ECB73FE08676629CF8930VI1PR0401MB2237_"
MIME-Version: 1.0
To: David Miller <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "richardcochran@gmail.com" <richardcochran@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Claudiu Manoil <claudiu.manoil@nxp.com>
List-ID: <devicetree@vger.kernel.org>

--_000_VI1PR0401MB22376A78ECB73FE08676629CF8930VI1PR0401MB2237_
Content-Type: text/plain; charset="iso-8859-7"
Content-Transfer-Encoding: quoted-printable

Hi David,
Sorry for that. I sent out v2 to fix that.
Thanks.

Best regards
Yangbo Lu
________________________________
From: David Miller <davem@davemloft.net>
Sent: Saturday, February 2, 2019 7:23:06 AM
To: Y.b. Lu
Cc: netdev@vger.kernel.org; devicetree@vger.kernel.org; richardcochran@gmai=
l.com; robh+dt@kernel.org; Claudiu Manoil
Subject: Re: [PATCH 0/9] Add ENETC PTP clock driver

From: David Miller <davem@davemloft.net>
Date: Fri, 01 Feb 2019 15:17:02 -0800 (PST)

> From: Yangbo Lu <yangbo.lu@nxp.com>
> Date: Thu, 31 Jan 2019 10:33:01 +0800
>
>> There is same QorIQ 1588 timer IP block on the new ENETC Ethernet
>> controller with eTSEC/DPAA Ethernet controllers. However it's
>> different endianness (little-endian) and using PCI driver.
>>
>> To support ENETC PTP driver, ptp_qoriq driver needed to be
>> reworked to make functions global for reusing, to add little-
>> endian support, to add ENETC memory map support, and to add
>> ENETC dependency for ptp_qoriq driver.
>>
>> In addition, although ENETC PTP driver is a PCI driver, the dts
>> node still could be used. Currently the ls1028a dtsi which is
>> the only platform by now using ENETC is not complete, so there
>> is still dependency for ENETC PTP node upstreaming. This will
>> be done in the near future. The hardware timestamping support
>> for ENETC is done but needs to be reworked with new method in
>> internal git tree, and will be sent out soon.
>
> Series applied to net-next, thanks.

Actually, I had to revert, this breaks the build:

drivers/net/ethernet/freescale/gianfar_ethtool.c: In function =A1gfar_get_t=
s_info=A2:
drivers/net/ethernet/freescale/gianfar_ethtool.c:1513:24: error: dereferenc=
ing pointer to incomplete type =A1struct qoriq_ptp=A2
   info->phc_index =3D ptp->phc_index;
                        ^~

--_000_VI1PR0401MB22376A78ECB73FE08676629CF8930VI1PR0401MB2237_
Content-Type: text/html; charset="iso-8859-7"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
7">
</head>
<body>
Hi David,<br>
Sorry for that. I sent out v2 to fix that.<br>
Thanks.<br>
<br>
Best regards <br>
Yangbo Lu
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> David Miller &lt;dave=
m@davemloft.net&gt;<br>
<b>Sent:</b> Saturday, February 2, 2019 7:23:06 AM<br>
<b>To:</b> Y.b. Lu<br>
<b>Cc:</b> netdev@vger.kernel.org; devicetree@vger.kernel.org; richardcochr=
an@gmail.com; robh&#43;dt@kernel.org; Claudiu Manoil<br>
<b>Subject:</b> Re: [PATCH 0/9] Add ENETC PTP clock driver</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: David Miller &lt;davem@davemloft.net&gt;<br>
Date: Fri, 01 Feb 2019 15:17:02 -0800 (PST)<br>
<br>
&gt; From: Yangbo Lu &lt;yangbo.lu@nxp.com&gt;<br>
&gt; Date: Thu, 31 Jan 2019 10:33:01 &#43;0800<br>
&gt; <br>
&gt;&gt; There is same QorIQ 1588 timer IP block on the new ENETC Ethernet<=
br>
&gt;&gt; controller with eTSEC/DPAA Ethernet controllers. However it's<br>
&gt;&gt; different endianness (little-endian) and using PCI driver.<br>
&gt;&gt; <br>
&gt;&gt; To support ENETC PTP driver, ptp_qoriq driver needed to be<br>
&gt;&gt; reworked to make functions global for reusing, to add little-<br>
&gt;&gt; endian support, to add ENETC memory map support, and to add<br>
&gt;&gt; ENETC dependency for ptp_qoriq driver.<br>
&gt;&gt; <br>
&gt;&gt; In addition, although ENETC PTP driver is a PCI driver, the dts<br=
>
&gt;&gt; node still could be used. Currently the ls1028a dtsi which is<br>
&gt;&gt; the only platform by now using ENETC is not complete, so there<br>
&gt;&gt; is still dependency for ENETC PTP node upstreaming. This will<br>
&gt;&gt; be done in the near future. The hardware timestamping support<br>
&gt;&gt; for ENETC is done but needs to be reworked with new method in<br>
&gt;&gt; internal git tree, and will be sent out soon.<br>
&gt; <br>
&gt; Series applied to net-next, thanks.<br>
<br>
Actually, I had to revert, this breaks the build:<br>
<br>
drivers/net/ethernet/freescale/gianfar_ethtool.c: In function =A1gfar_get_t=
s_info=A2:<br>
drivers/net/ethernet/freescale/gianfar_ethtool.c:1513:24: error: dereferenc=
ing pointer to incomplete type =A1struct qoriq_ptp=A2<br>
&nbsp;&nbsp; info-&gt;phc_index =3D ptp-&gt;phc_index;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR0401MB22376A78ECB73FE08676629CF8930VI1PR0401MB2237_--
