From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v4 0/7] PM8005 and PMS405 regulator support
Date: Mon, 17 Jun 2019 09:04:23 -0600
Message-ID: <CAOCk7NrSBjbyJ3YJoF22i9ysxVTw38SvsaSi9JwVrj7W8er24A@mail.gmail.com>
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com> <20190617145853.GT5316@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617145853.GT5316@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, lgirdwood@gmail.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, MSM <linux-arm-msm@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 17, 2019 at 8:58 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jun 13, 2019 at 02:24:36PM -0700, Jeffrey Hugo wrote:
> > The MSM8998 MTP reference platform supplies VDD_GFX from s1 of the
> > pm8005 PMIC.  VDD_GFX is needed to turn on the GPU.  As we are looking
> > to bring up the GPU, add the support for pm8005 and wire up s1 in a
> > basic manner so that we have this dependency out of the way and can
> > focus on enabling the GPU driver.
>
> There's something really weird with the threading in how you posted
> these, a few of the patches are in reply to the prior patch so indented
> a level down.

Sorry about that.  Bjorn pointed it out to me, and I think I figured
out the glitch on
my end.

Are you ok to proceed in the review, or do you want a repost?
