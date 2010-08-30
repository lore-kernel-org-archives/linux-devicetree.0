From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 3/7] drivers/mtd/nand/mpc5121_nfc.c: Add of_node_put to
 avoid memory leak
Date: Mon, 30 Aug 2010 16:13:40 +0300
Message-ID: <1283174020.12995.77.camel@brekeke>
References: <1283075566-27441-1-git-send-email-julia@diku.dk>
	 <1283075566-27441-4-git-send-email-julia@diku.dk>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1283075566-27441-4-git-send-email-julia@diku.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Julia Lawall <julia@diku.dk>
Cc: David Woodhouse <dwmw2@infradead.org>, kernel-janitors@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Sun, 2010-08-29 at 11:52 +0200, Julia Lawall wrote:
> Add a call to of_node_put in the error handling code following a call=
 to
> of_find_compatible_node.
>=20
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)

Pushed to l2-mtd-2.6.git / master, thanks.

--=20
Best Regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
