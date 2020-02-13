Return-Path: <SRS0=Uhz2=4B=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB9EC2BA83
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 15:19:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FE34246C8
	for <linux-devicetree@archiver.kernel.org>; Thu, 13 Feb 2020 15:19:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="qg0l7wCP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727667AbgBMPTh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 13 Feb 2020 10:19:37 -0500
Received: from mail-eopbgr30066.outbound.protection.outlook.com ([40.107.3.66]:9862
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725781AbgBMPTh (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 13 Feb 2020 10:19:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Po/jWCqsoqdxoF+wcqG5H8Y76/vzzsTQCHgiPhuKgdaUPyLGet4hV8OvyOtCbjHG2qAdv0uw9LNBUn1TOtx7vQaaUyrApw+kkV0TSG1t4A0aDCKCnhEy7Cm0TKzKbQq471wFWIx5bufsAH7Rls/tQHdGBPw7y2XlP8N9jGn+WM8h5LJykZKCrIym4V3mgsWUCmgbc44pZsPHkfXvinONMpqxQF0O0CtuK2RfZlTw23SfugQFMot8vH45qgG0BzmelCS8BS89sFWZECTBFwZpOKqj7/lwi1/q+KtbRi7PutfcqVPw+HUNNsSLzx8/0clMxoWxuBfpsgp6nPfjkAabiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhZA6b9pHBNvc5lhzzgpLGo6PtmIpsFmXIa3/rd3LM4=;
 b=BgLtbK7daaeiWBuJ4naKj8xjLIT5ak0AU8E+Y6CCSJf2vsCw9lFkkvr0+w6lEkZ1UdCfpb/3vU1E34QXPMEkfWHjizcTvN/KBakFfE3N6Ub00xq9CYYskNFGHbaLUZlt5TFVhdFhujA08Z60W49CDmuVcpn+Ag4xFQIGjzuXzytwFF3h4gYw4uwvNJz65yX9/pVux9A0vypunzX76LBSmkpwoua/gCpPzrQ73PRR2K5PV3PvbqOHXYj91yPRz8pUiV5awWVFyMhkqekL8uNjpwHr6I6adbL4HQYwjfWYf3c7cCOGDUzaFUSrh5m7s77uV/9uHwdrwHoDGu8ex31Fkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhZA6b9pHBNvc5lhzzgpLGo6PtmIpsFmXIa3/rd3LM4=;
 b=qg0l7wCPlNFYqiFhWeDI0bAuVvK7F+Nyz83cQGp1Ck3HqiCxk1h/8qaH1Ws7peNEExqyXo+5H3xoD4UCNV0T/1udlvmUZ7P7MCJvTlCFFqDNBE6MDocvygAb9mwuWfTB6ToEU/JRPWwEAyXfQ+TrkYTrQDQzMsT0BFpUs4zFQB0=
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com (10.186.159.144) by
 VI1PR04MB5310.eurprd04.prod.outlook.com (20.177.49.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Thu, 13 Feb 2020 15:19:30 +0000
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::58c5:f02f:2211:4953]) by VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::58c5:f02f:2211:4953%7]) with mapi id 15.20.2729.024; Thu, 13 Feb 2020
 15:19:30 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Lucas Stach <l.stach@pengutronix.de>, Jacky Bai <ping.bai@nxp.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>,
        Adam Ford <aford173@gmail.com>,
        Sudeep Holla <sudeep.holla@arm.com>
CC:     Aisheng Dong <aisheng.dong@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Peng Fan <peng.fan@nxp.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        =?iso-8859-1?Q?Cl=E9ment_Faure?= <clement.faure@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Andre Przywara <andre.przywara@arm.com>,
        Silvano Di Ninno <silvano.dininno@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 0/3] Add power domain driver support for i.mx8m family
Thread-Topic: [PATCH 0/3] Add power domain driver support for i.mx8m family
Thread-Index: AQHVlbJUjk96rt7it0SasfL+3D85Eg==
Date:   Thu, 13 Feb 2020 15:19:30 +0000
Message-ID: <VI1PR04MB70239743AA9C1BDC93E527EFEE1A0@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <20190417053211.2195-1-ping.bai@nxp.com>
 <AM0PR04MB42116FEB1EE2CAE68A1CAA8980250@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <1555503195.2317.19.camel@pengutronix.de>
 <VI1PR04MB55330105F4839FCF98B7CFC0EE250@VI1PR04MB5533.eurprd04.prod.outlook.com>
 <68aaace3-f66e-b4b8-30a0-57b8b66a7524@arm.com>
 <VI1PR04MB5533A1F87436C0839A772D03EE250@VI1PR04MB5533.eurprd04.prod.outlook.com>
 <20190418144330.GD7770@e107155-lin>
 <CAHCN7xKK3zWE9i24prauPw0DSNTjASsMgDYY8w3OBJ+hb2y-sg@mail.gmail.com>
 <871ac22a-0508-8e92-b012-f414be5bd174@kontron.de>
 <VI1PR04MB6992DF27336AC51945D1C0C1871A0@VI1PR04MB6992.eurprd04.prod.outlook.com>
 <0a8a4edcf110ec5bcf859c145ef27553039c6cd0.camel@pengutronix.de>
 <VI1PR04MB70232F5A51F3F2B02BDB344EEE1A0@VI1PR04MB7023.eurprd04.prod.outlook.com>
 <e09e5fdc9fc71a7ca35e6f419f660b633d55224f.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 19fd8e6d-0e23-46fc-c2ba-08d7b0981f70
x-ms-traffictypediagnostic: VI1PR04MB5310:|VI1PR04MB5310:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB5310FB1228D837BB01BBECEAEE1A0@VI1PR04MB5310.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 031257FE13
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(366004)(136003)(346002)(39860400002)(199004)(189003)(86362001)(81166006)(6506007)(53546011)(81156014)(5660300002)(8676002)(4326008)(44832011)(55016002)(9686003)(186003)(7416002)(478600001)(66574012)(26005)(91956017)(316002)(33656002)(110136005)(54906003)(71200400001)(64756008)(66476007)(66946007)(8936002)(2906002)(52536014)(76116006)(66446008)(66556008)(7696005);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB5310;H:VI1PR04MB7023.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +7UBaG4Dn3pKLrf7rTWlJlpSfSlo6e2RqxOXexUCytwcnAlm9wKoIhv+08J0rPdoaMbKO4j0ymHzZ48eI9bt3GEnqx7rK5GzJDDVbtby327H9WACzDAe2AvUHl83TkLQDCjx63Rc3ieNA3V08Pazcawi90FvsO3WihnSU8YTO6Pvmopai5vkQuB8H1iGgDBe6oiUjirHI/tQkUiCktxg+veb8GMHtG1+pONltX3osiOZk8qjSmsEQKNt1GNdls7KMXZFA6uEEQzJ304OKxKHCUoNprh4C5zK0x0waZl8KVhwQdHNdRIDMENbm7QlroTA3BeWmT1uT5o+cmUKccbidxK86c8EpTkUtakuZnkxqeou69eD+57HnK/rilVt+a94K4QXXiCfQV8nK+jgJI4zTrPFdjN9Rlu4LgN1WFrKgJQ+sfojcOdj4f0BCKAatfk2
x-ms-exchange-antispam-messagedata: CgtKDHzVAZj0ANLHtCrZDxGp4DSPtQD16OHacHTEoRSNh5snrMWtEvVcQyZPpV3Zt9qom/ToMHalErktqcTxI+in07X6A8zZO8AMAV6/T1mEnDPPWCgPVS0CzY/0lskoCF8uEhpHRxEoroTmy0161A==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19fd8e6d-0e23-46fc-c2ba-08d7b0981f70
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2020 15:19:30.4070
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N2UKwt9wMjjAw6dsIIwsFLouVlxhUQ4pGUCDocjX8UfKXy96X0pjWdWkUH3vrDLkQBftbZczwZzbSuLYLOgcnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5310
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 13.02.2020 16:47, Lucas Stach wrote:=0A=
> On Do, 2020-02-13 at 14:30 +0000, Leonard Crestez wrote:=0A=
>> On 13.02.2020 13:32, Lucas Stach wrote:=0A=
>>> On Do, 2020-02-13 at 09:21 +0000, Jacky Bai wrote:=0A=
>>>>> -----Original Message-----=0A=
>>>>> From: Schrempf Frieder <frieder.schrempf@kontron.de>=0A=
>>>>> Sent: Thursday, February 13, 2020 5:16 PM=0A=
>>>>> To: Adam Ford <aford173@gmail.com>; Sudeep Holla=0A=
>>>>> <sudeep.holla@arm.com>=0A=
>>>>> Cc: Aisheng Dong <aisheng.dong@nxp.com>; mark.rutland@arm.com; Peng=
=0A=
>>>>> Fan <peng.fan@nxp.com>; Souvik Chakravarty=0A=
>>>>> <Souvik.Chakravarty@arm.com>; Jacky Bai <ping.bai@nxp.com>;=0A=
>>>>> devicetree@vger.kernel.org; Cl=E9ment Faure <clement.faure@nxp.com>;=
=0A=
>>>>> s.hauer@pengutronix.de; shawnguo@kernel.org; robh+dt@kernel.org;=0A=
>>>>> dl-linux-imx <linux-imx@nxp.com>; kernel@pengutronix.de; Andre Przywa=
ra=0A=
>>>>> <andre.przywara@arm.com>; Silvano Di Ninno <silvano.dininno@nxp.com>;=
=0A=
>>>>> Leonard Crestez <leonard.crestez@nxp.com>; festevam@gmail.com;=0A=
>>>>> linux-arm-kernel@lists.infradead.org; Lucas Stach <l.stach@pengutroni=
x.de>=0A=
>>>>> Subject: Re: [PATCH 0/3] Add power domain driver support for i.mx8m f=
amily=0A=
>>>>>=0A=
>>>>> Hi,=0A=
>>>>>=0A=
>>>>> On 07.11.19 22:28, Adam Ford wrote:=0A=
>>>>>> On Thu, Apr 18, 2019 at 9:43 AM Sudeep Holla <sudeep.holla@arm.com>=
=0A=
>>>>> wrote:=0A=
>>>>>>> On Wed, Apr 17, 2019 at 04:21:55PM +0000, Leonard Crestez wrote:=0A=
>>>>>>>> On 4/17/2019 4:33 PM, Sudeep Holla wrote:=0A=
>>>>>>>>>>> I don't yet buy the security argument. There are many more shar=
ed=0A=
>>>>>>>>>>> parts on the SoC, like the clock controller, that would need to=
=0A=
>>>>>>>>>>> be taken away from the non-secure world if one would want to ru=
n=0A=
>>>>>>>>>>> an untrusted OS kernel on a i.MX8M system.=0A=
>>>>>>>>>>>=0A=
>>>>>>>>>>> To properly implement security on any i.MX8M based system the=
=0A=
>>>>>>>>>>> firmware would need to grow something like a full ARM SCPI=0A=
>>>>>>>>>>> implementation, so all shared critical peripherals are solely u=
nder=0A=
>>>>> firmware control.=0A=
>>>>>>>>>> It might be possible to rework this to use some form of=0A=
>>>>>>>>>> SCMI-over-SMC instead of vendor-specific SMCCC SIP calls=0A=
>>>>>>=0A=
>>>>>> I was just curious to know if there is any progress being made on=0A=
>>>>>> this.  The i.mx8mm-evk is missing functionality upstream and I think=
=0A=
>>>>>> the power domain support would help enable some of these features.=
=0A=
>>>>>>=0A=
>>>>>=0A=
>>>>> Has there been any decision or action taken in this topic?=0A=
>>>>> Will the power domain driver as proposed in this patch be upstreamed =
at=0A=
>>>>> some time, or rather not?=0A=
>>>>>=0A=
>>>>> I try to build a mainline BSP for i.MX8MM (ML U-Boot, ML TF-A, ML Lin=
ux)=0A=
>>>>> and I integrated display and graphics support from the downstream NXP=
=0A=
>>>>> kernel.=0A=
>>>>>=0A=
>>>>> While most things already work fine, there's the issue of how to hand=
le the=0A=
>>>>> power domains. Currently I need to ungate some clocks in the TF-A=0A=
>>>>> BL31 to get for example the GPU running. If I understand this correct=
ly the=0A=
>>>>> proposed power domain driver could handle this in Linux otherwise.=0A=
>>>>>=0A=
>>>>=0A=
>>>> the SCMI over SMC is still under review=0A=
>>>=0A=
>>> Even if the SCMI over SMC is ready at some point, it's still unclear to=
=0A=
>>> me how you intend to abstract the GPC behind the SCMI interface in the=
=0A=
>>> TF-A. The power domains have dependencies both into the regulator and=
=0A=
>>> the clock framework. Both are currently under exclusive control of the=
=0A=
>>> rich OS. How do you intend to allow the TF-A to control the power=0A=
>>> supplies and necessary reset clocks without messing up any state in the=
=0A=
>>> rich OS?=0A=
>>=0A=
>> This is indeed difficult, SCMI assumes that the responder has sufficient=
=0A=
>> control over clocks to fully implement power domain handling, including=
=0A=
>> over clocks and regulators.=0A=
>>=0A=
>> Perhaps it might be possible to modify current gpcv2 driver to send SCMI=
=0A=
>> messages for power only and keep handling regulators itself? It could=0A=
>> switch based on whether it has a reference to a scmi channel as a DT=0A=
>> property.=0A=
> =0A=
> With such a split implementation I feel like we are getting worst of=0A=
> both worlds: more complexity as the implementation is split across=0A=
> multiple components (TF-A and kernel) and still the rich OS is able to=0A=
> mess up the power supply of a domain that it might not even own. This=0A=
> doesn't sound really enticing.=0A=
> =0A=
> IMHO it only makes sense to push this functionality down into TF-A if=0A=
> it allows to abstract all the implementation details behind a standard=0A=
> interface like SCMI. But then the needed changes are much more invasive=
=0A=
> than just pushing down the GPC implementation.=0A=
> =0A=
>> A full scmi-based implementation might use entirely very different=0A=
>> bindings and take a long time. If people want to support their chips by=
=0A=
>> implementing power domain support in the rich OS we shouldn't block them=
.=0A=
>>=0A=
>> So it would be good to accept gpcv2 enhancement for 8mm and similar.=0A=
> =0A=
> I fully agree.=0A=
> =0A=
> For a full SCMI based implementation I expect that much more than just=0A=
> the GPC functionality needs to be pushed down into the TF-A. Right now=0A=
> I see clocks, i2c and regulator handling, maybe there is more that=0A=
> escapes my mind.=0A=
=0A=
I2C regulator handling inside TF-A sounds very difficult. Not only would =
=0A=
upstream TF-A likely object but on imx8m EVK boards the i2c bus for =0A=
regulators is shared with other devices (like camera).=0A=
=0A=
So if we do this maybe SCMI dt bindings could be expanded to at least =0A=
allow regulators on a per-domain basis?=0A=
=0A=
> We should not block a Linux based implementation of this functionality=0A=
> on the basis that we might want to replace this with a SCMI based one=0A=
> at a later point in time.=0A=
