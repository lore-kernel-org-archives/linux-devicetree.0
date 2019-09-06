Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1561691950-42154-3-git-send-email-preid@electromag.com.au>
References: <1561691950-42154-1-git-send-email-preid@electromag.com.au> <1561691950-42154-3-git-send-email-preid@electromag.com.au>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 2/2] clk: clk-cdce925: Add regulator support
Date: Fri, 06 Sep 2019 10:32:06 -0700
Message-Id: <20190906173207.50491206A1@mail.kernel.org>
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, preid@electromag.com.au, robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

Quoting Phil Reid (2019-06-27 20:19:10)
> The cdce925 power supplies could be controllable on some platforms.
> Enable them before communicating with the cdce925.
>=20
> Signed-off-by: Phil Reid <preid@electromag.com.au>
> ---

Applied to clk-next
