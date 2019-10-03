From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 3/3] clk: qcom: Add Global Clock controller (GCC) driver for SC7180
Date: Thu, 03 Oct 2019 09:01:29 -0700
Message-ID: <20191003160130.5A19B222D0@mail.kernel.org>
References: <20190918095018.17979-1-tdas@codeaurora.org> <20190918095018.17979-4-tdas@codeaurora.org> <20190918213946.DC03521924@mail.kernel.org> <a3cd82c9-8bfa-f4a3-ab1f-2e397fbd9d16@codeaurora.org> <20190924231223.9012C207FD@mail.kernel.org> <347780b9-c66b-01c4-b547-b03de2cf3078@codeaurora.org> <20190925130346.42E0820640@mail.kernel.org> <35f8b699-6ff7-9104-5e3d-ef4ee8635832@codeaurora.org> <20191001143825.CD3212054F@mail.kernel.org> <7ac5f6bf-33c5-580e-bd40-e82f3052d460@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7ac5f6bf-33c5-580e-bd40-e82f3052d460@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>, robh+dt@kernel.org
Cc: David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Taniya Das (2019-10-03 03:31:15)
> Hi Stephen,
>=20
> On 10/1/2019 8:08 PM, Stephen Boyd wrote:
> >=20
> > Why do you want to keep them critical and registered? I'm suggesting
> > that any clk that is marked critical and doesn't have a parent should
> > instead become a register write in probe to turn the clk on.
> >=20
> Sure, let me do a one-time enable from probe for the clocks which=20
> doesn't have a parent.
> But I would now have to educate the clients of these clocks to remove=20
> using them.
>=20

If anyone is using these clks we can return NULL from the provider for
the specifier so that we indicate there isn't support for them in the
kernel. At least I hope that code path still works given all the recent
changes to clk_get().
