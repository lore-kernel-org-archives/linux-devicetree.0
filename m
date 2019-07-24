From: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: Update Qualcomm SDM845 DT bindings
Date: Wed, 24 Jul 2019 11:27:40 -0700
Message-ID: <5d38a31d.1c69fb81.80992.0052@mx.google.com>
References: <1563568344-1274-1-git-send-email-daidavid1@codeaurora.org> <1563568344-1274-2-git-send-email-daidavid1@codeaurora.org> <5d371ce7.1c69fb81.9650.8239@mx.google.com> <8c181f08-559b-5d77-a617-65cfd3d5da55@codeaurora.org> <5d3868a9.1c69fb81.876aa.ac30@mx.google.com> <8efd5c48-5d3a-97e1-1dec-6a9cdc4c8ef6@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <8efd5c48-5d3a-97e1-1dec-6a9cdc4c8ef6@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Dai <daidavid1@codeaurora.org>, bjorn.andersson@linaro.org, georgi.djakov@linaro.org, robh+dt@kernel.org
Cc: evgreen@google.com, ilina@codeaurora.org, seansw@qti.qualcomm.com, elder@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting David Dai (2019-07-24 10:22:57)
>=20
> The way that I view this is that the consumers consume both bandwidth=20
> and QoS from these physical NoC devices by getting some path between two =

> endpoints on these different NoCs and applying some constraints. The NoC =

> providers can accomplish that either by writing to MMIO spaces or by=20
> talking to some remote processor/hardware to tune its clock speed. The=20
> consumer doesn't interact with the RSCs directly, but can select a=20
> different bcm voter based on the endpoints that are associated with a=20
> particular bcm(apps or disp rsc). Each node(endpoints) will have its own =

> BCM designation and an unique bcm voter.

Ok. I get it now. The MMIO nodes will be interconnect providers and
they'll know what RSCs they can use by exposing the same RSC "resource"
multiple times for each RSC that can be targeted? This is what the
postfix is with _DISP on your examples? Presumably there's an _APPS
version of the same prefixed endpoint in case the consumer wants to use
the APPS RSC instead of the DISP one, or maybe there's just no postfix
in this case because APPS is the "default".
