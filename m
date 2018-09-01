From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 0/4] media: platform: Add Aspeed Video Engine driver
Date: Fri, 31 Aug 2018 19:46:54 -0700
Message-ID: <153577001451.19113.16924655760277630355@swboyd.mtv.corp.google.com>
References: <1535576973-8067-1-git-send-email-eajames@linux.vnet.ibm.com>
 <153573819126.93865.1884182656081956202@swboyd.mtv.corp.google.com>
 <a959a032-6817-dcb4-2c5f-b4bd17fc1c8b@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a959a032-6817-dcb4-2c5f-b4bd17fc1c8b@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eddie James <eajames@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, andrew@aj.id.au, mchehab@kernel.org, joel@jms.id.au, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Quoting Eddie James (2018-08-31 12:30:02)
> =

> =

> On 08/31/2018 12:56 PM, Stephen Boyd wrote:
> > Quoting Eddie James (2018-08-29 14:09:29)
> > Please let me know your merge strategy here. I can ack the clk patches
> > because they look fine from high-level clk driver perspective (maybe
> > Joel can take a closer look) or I can merge the patches into clk-next
> > and get them into next release while the video driver gets reviewed.
> =

> Thanks for taking a look! Probably preferable to get the clk patches =

> into clk-next first (though Joel reviewing would be great). I just put =

> everything in the same set for the sake of explaining the necessity of =

> the clk changes.
> =


Ok. If Joel is able to review then I can easily merge it into clk-next.
