Return-Path: <SRS0=Rgsm=GK=chromium.org=swboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <CAD=FV=Vq4Q2LvY_O-YsdyUmQOUANa0ap+U9j7PXSD3_ao6sCdQ@mail.gmail.com>
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
 <1521071931-9294-7-git-send-email-kramasub@codeaurora.org>
 <CAD=FV=Wk5apkO9ro+PkLGDS7poJgvTkDA4uSKnMXmK=GMzuMcQ@mail.gmail.com>
 <65fa4ff5-7f37-b6fd-e493-bec18511d334@codeaurora.org>
 <CAD=FV=Vq4Q2LvY_O-YsdyUmQOUANa0ap+U9j7PXSD3_ao6sCdQ@mail.gmail.com>
Message-ID: <152153190602.254778.17328050728636145822@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v4 6/6] arm64: dts: sdm845: Add I2C controller support
Date: Tue, 20 Mar 2018 00:45:06 -0700
To: Doug Anderson <dianders@chromium.org>, Sagar Dharia <sdharia@codeaurora.org>
Cc: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wolfram Sang <wsa@the-dreams.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>, evgreen@chromium.org, acourbot@chromium.org, Bjorn Andersson <bjorn.andersson@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Quoting Doug Anderson (2018-03-19 16:56:27)
> On Mon, Mar 19, 2018 at 3:15 PM, Sagar Dharia <sdharia@codeaurora.org> wr=
ote:
> >
> > Yes, we typically have a "platform(sdm845 here)-qupv3.dtsi" defining
> > most of the serial-bus instances (i2c, spi, and uart with
> > status=3Ddisabled) that we include from the common header. The boards
> > enable instances they need.
> > Will that be okay?
> =

> Unless you really feel the need to put these in a separate file I'd
> just put them straight in sdm845.dtsi.  Yeah, it'll get big, but
> that's OK by me.  I _think_ this matches what Bjorn was suggesting on
> previous device tree patches, but CCing him just in case.  I'm
> personally OK with whatever Bjorn and other folks with more Qualcomm
> history would like.

Upstream puts all SoC nodes in the SoC file. The split file by
functional area method is to avoid merge conflicts in the SoC file and
that doesn't make sense outside of the internal workflow.
