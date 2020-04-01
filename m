Return-Path: <SRS0=fmve=5R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09145C43331
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 09:14:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C492E20784
	for <linux-devicetree@archiver.kernel.org>; Wed,  1 Apr 2020 09:14:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="MEQawrRA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732143AbgDAJOl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 1 Apr 2020 05:14:41 -0400
Received: from mail-eopbgr80057.outbound.protection.outlook.com ([40.107.8.57]:29437
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732141AbgDAJOl (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 1 Apr 2020 05:14:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWdXRkGRNQuZl5UwIh/BzyalmahhyUbJwqS2bXOk4mV/nUJmluVvQlB0i2QIrPD7YioxzGn0gjdP4PLrcx4U16hUJu2QQTphVDNgzGKeZ+T6kbi0eVpCYRLZur4JKeEtnF1f02Nbd+v/0aC2jDeCKak3dfMNKSl0VwvYa5hnInbf6pAnBpy59VNA6PfwTpVmlzVGgeS49lHsBU1kaJCVxc74gk9m6P4i+OEMMDnOvcuC9b/TmrrqYCDxSYHYbJIDbaMnLRJVLLQzSGXT0ioRNlfpXg256T4ylHALOOJRPXwSuCHXmk541vsVdRln0FY7Vg5NSkpGo/9CdqPtHcl0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucjZifibYVWcXAcTWYBlC1LprzZi7XnRdEG8NE4nbrw=;
 b=TnMzPUWBh2DNvinIVMB9elY7gktC24tOFkfuorFQWKOrD0BPVPML1yFbeYIX+5x7yPw7TlkF9P2E2mb08g9xCFEq9T6o+sRWC2hMy4Ifw/BxrAZXfC4EhpWoM3yctS8FE8dq2+MqLwZxKn+WV4epIwyGBMLbzTgIN8QaVO2CFCdeMqG+gNoJQm7G5er5cw4F0/p9aRp5dtEteyjf3NbcpH3H2Mt/Sa0Ii9iQ3h6a4RbmVgZdq/2JE3rGtQ24kkwBHVvNbdJ6WSOUDMkxd/HmG8FhcO+/7qKkPqDzLAUfsrxztry+ukolodf2V2G3j3eYSlLylYnMJLD4HlXKrO/pCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ucjZifibYVWcXAcTWYBlC1LprzZi7XnRdEG8NE4nbrw=;
 b=MEQawrRAHn25CYP0t/iEB/thuHcymzazVBjCB4miJoLrDKDULUT3Aseu0GEzOsemT73rM3hq8eTruGrwoVNmyMXTryIjhkHUHUCqzX8BwcydubFfMcRF/3N4QTJMbmMgkJ5ZEzDuxIwoDAnPmDwDJTJx1fYbKnQK1k+DEz0I12c=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB6324.eurprd04.prod.outlook.com (20.179.34.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.18; Wed, 1 Apr 2020 09:14:36 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::ad44:6b0d:205d:f8fc%7]) with mapi id 15.20.2856.019; Wed, 1 Apr 2020
 09:14:36 +0000
From:   Peng Fan <peng.fan@nxp.com>
To:     Sudeep Holla <sudeep.holla@arm.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH 1/4] firmware: arm_scmi: Make mutex channel specific
Thread-Topic: [PATCH 1/4] firmware: arm_scmi: Make mutex channel specific
Thread-Index: AQHWBFX27nJMU2DyaUm7ucC0dRZvA6hje9AQgACGwACAAACPYA==
Date:   Wed, 1 Apr 2020 09:14:36 +0000
Message-ID: <AM0PR04MB4481E4CC4FA7A55488E7663988C90@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20200327163654.13389-1-sudeep.holla@arm.com>
 <20200327163654.13389-2-sudeep.holla@arm.com>
 <AM0PR04MB4481562E2A31386752F92C4488C90@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <20200401091208.GB3954@bogus>
In-Reply-To: <20200401091208.GB3954@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 19112969-722c-4b81-fd11-08d7d61d1991
x-ms-traffictypediagnostic: AM0PR04MB6324:|AM0PR04MB6324:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB63241D81632EA98ABD5B359888C90@AM0PR04MB6324.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 03607C04F0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB4481.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(52536014)(26005)(5660300002)(66946007)(71200400001)(66446008)(4326008)(2906002)(33656002)(76116006)(186003)(316002)(8936002)(44832011)(86362001)(66556008)(7696005)(54906003)(66476007)(81156014)(6916009)(9686003)(55016002)(6506007)(478600001)(64756008)(81166006)(8676002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8e6bKpihNZepJncl+9xCG9hmp0wEsamEhcXAics6927py424wR40IHbtlQD+ZiQ7Ops+IwKyKQHYg5GSB93wwo62nzuvSwH0u6U7B0WH9l3TX1CbjrkBKFGswH3CWBTskZCxkxJzlduXTm3KvGMlNVXfv7gDvJsSjzXdBu4b3KxNWEyg3a9wHR48ie/KTPcUDuj7+XpebCCYuJY5U9+DjxBfXT5qU3xjIexB2M5PQzSqBjF0fHZwMmPaU6icoFhUAbqh6ibRNBrzMU+HPtFg/V8ZX0G7hW1g0fX49WLhOWsnjtFLkru4crQvqm6poJJtDoQIPj+eSqoE1M2cYkr3z2ZSCxeQ7CAdlv4TAenY3KwfN1frQUHpfOZTk2biHxS4e5tzqu42AQZZlhZ2btAhZ6geEMr85PfMsEeBK9l0/RbJmmnUZbsFgZ8wWc72YsBc
x-ms-exchange-antispam-messagedata: jERP86l+zOQHojqR+UnqgUqG6M1OEIww/Ip8xzFQhxfgpOg/yGtZXJJgnyi6uyyPg3QnSp5tIqMw6XjVNdkK6YH7FfNKAcIuFzHEPDGlhV92tqkr52bosVZbx19OuQ8sSYxqztygNfCWVQblFfAOzA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19112969-722c-4b81-fd11-08d7d61d1991
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2020 09:14:36.6698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7j4ZRpkUszKmZet6F1zuIJadkEeaJo9ezfBy/3jPRNb8rYSw4Yn792eLayyMi2bfJkTsCOR+hsueEOn9G5SNZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6324
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

> Subject: Re: [PATCH 1/4] firmware: arm_scmi: Make mutex channel specific
>=20
> On Wed, Apr 01, 2020 at 01:12:37AM +0000, Peng Fan wrote:
> > Hi Sudeep,
> >
> > > Subject: [PATCH 1/4] firmware: arm_scmi: Make mutex channel specific
> > >
> > > In order to support multiple SMC/HVC transport channels with
> > > associated shared memory,
> >
> > Does this mean each channel will have its own shared memory? Or All
> > channels share the same shared memory?
> >
>=20
> It depends on platform firmware and DT. If there is only one shmem at the=
 top
> level scmi node, all share that single channel. If some/all protocols hav=
e their
> own channel, they there must be shmem entry in the corresponding child
> node.
>=20
> > it is better to maintain the mutex per channel instead of
> > > existing global one.
> >
> > If all channels shared the same memory, use per channel mutex lock
> > will not be able to prevent other channels accessing shared memory at
> > the same time.
> >
>=20
> No we don't create channel per protocol. If they share, we just share the
> channel pointer. Look at:
>=20
>        if (!info->desc->ops->chan_available(dev, idx)) {
>                 cinfo =3D idr_find(idr, SCMI_PROTOCOL_BASE);
>                 if (unlikely(!cinfo)) /* Possible only if platform has no=
 Rx */
>                         return -EINVAL;
>                 goto idr_alloc;
>         }
>=20
> If a protocol doesn't have a dedicated channel, we just assign the base
> protocol channel to it. We don't call chan_setup at all on that channel.
> Your patch assumed so but the core driver never did that.
>=20
> Hope this clarifies you doubt.

Yes. Thanks for the explainaiton.

Thanks,
Peng.

>=20
> --
> Regards,
> Sudeep
