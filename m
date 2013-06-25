From: James Hogan <james.hogan@imgtec.com>
Subject: Re: [PATCH 0/4] Fix more issues with generic pinconf bindings
Date: Tue, 25 Jun 2013 14:16:19 +0100
Message-ID: <51C99823.1060503@imgtec.com>
References: <201306251455.01540.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201306251455.01540.heiko@sntech.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On 25/06/13 13:55, Heiko St=C3=BCbner wrote:
> As Stephen Warren pointed out, some pinconf bindings had deficits
> either in documentation or in the whole thought process.
>=20
> Therefore this series tries to fix these issues by improving
> documentation and removing the real controversial bindings for now.
>=20
> Of the changed pinconf bindings only the slew-rate had an acutal
> current user (since yesterday). James I hope it's ok to simply
> remove the slew-rate handling from the tz1090 driver until we can
> handle it correctly in dt.

Other than my comment about patch 3 (which since it's the only case I
don't mind too much, it can easily be added back again in the future):

Reviewed-by: James Hogan <james.hogan@imgtec.com>

Cheers
James
