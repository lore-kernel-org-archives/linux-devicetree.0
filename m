From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 04/12] ARM: dts: dragonboard-600c: add board support with serial
Date: Thu, 24 Mar 2016 13:49:27 +0100
Message-ID: <13628309.0RksfiTndH@wuerfel>
References: <1458762366-9233-1-git-send-email-srinivas.kandagatla@linaro.org> <CAOCOHw7TyzDf4jvAMChOFFEgsL4Z1+CcESLOuckT=Q7W9hQvCw@mail.gmail.com> <56F3477E.8090205@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <56F3477E.8090205@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Andy Gross <andy.gross@linaro.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lkml <linux-kernel@vger.kernel.org>, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 23 March 2016 18:48:46 Stephen Boyd wrote:
> >>
> > This "sbc" isn't that just the abbreviation for "single board
> > computer"? I find it hard to believe this is _the_ 8064 sbc or the
> > only 8064 sbc.
> 
> I don't make up the names, but for other qcom sbc products the
> bootloader is looking for sbc there to make sure it picks the right dtb
> blob. So I guess this is _the_ qcom 8064 sbc? Definitely not _the_ 8064
> sbc though.
> 

Is it even made by Qualcomm? IIRC the 410c is made by Arrow, not Qualcomm.

	Arnd
