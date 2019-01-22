From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v3 02/10] arm64: dts: qcom: sdm845: Define rmtfs memory
Date: Tue, 22 Jan 2019 15:34:51 -0800
Message-ID: <CA+ASDXN2+bBiOT6svRE+1VtY7BQTFjjD_s4pzO8J7-dDx9QLDQ@mail.gmail.com>
References: <20190122055112.30943-1-bjorn.andersson@linaro.org>
 <20190122055112.30943-3-bjorn.andersson@linaro.org> <CAD=FV=X0x4hQ=8yQ6wDWE8ximf9A8hpgpRWTdPrFXDD4FVO8VQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAD=FV=X0x4hQ=8yQ6wDWE8ximf9A8hpgpRWTdPrFXDD4FVO8VQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Sibi Sankar <sibis@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Evan Green <evgreen@chromium.org>, Ben Chan <benchan@google.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 22, 2019 at 3:26 PM Doug Anderson <dianders@chromium.org> wrote:
> 2. In https://crrev.com/c/1119572, the argument was made that the size
> of this carveout is board-specific.  That makes it hard to put it in
> sdm845.dts.

And we've increased the size of the memory carve-out since then,
because the memory requirements depend on the SW features you're using
on the modem side.

So that's definitely a reason for giving it a label we can modify it
with, at a minimum (as Doug suggested). I'm somewhat ambivalent as to
whether this should or shouldn't go in the base sdm845.dtsi -- it's
still a feature where most of the definitions (e.g., compatible;
client ID) should be applicable to all boards.

Brian
