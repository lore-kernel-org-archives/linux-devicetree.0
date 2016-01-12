From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/5] arm64: dts: apq8016-sbc: move sdhci node under soc node
Date: Tue, 12 Jan 2016 15:49:52 +0100
Message-ID: <5301475.Pt8xa8PKiv@wuerfel>
References: <1452606358-24569-1-git-send-email-srinivas.kandagatla@linaro.org> <18094818.3Fy0P66y0u@wuerfel> <56950B4D.3030707@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56950B4D.3030707@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, andy.gross@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 12 January 2016 14:18:53 Srinivas Kandagatla wrote:
> On 12/01/16 14:00, Arnd Bergmann wrote:
> > On Tuesday 12 January 2016 13:46:52 Srinivas Kandagatla wrote:
> >> To be consistent with other nodes move sdhci node under the soc node,
> >> rather than using lable references.
> >>
> >> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >>
> >
> > Maybe remove the label as well if you are no longer using it?
> Label "sdhc_1" in this case is used in aliases node.
> 

Ok, nevermind then.

> My understanding so far was qcom specific dt want to use hierarchical dt 
> nodes in the board files, but this brings the question of should we 
> delete all the unused labels.
> 
> IMO, some unused labels are harmless and would give more consistency to 
> the reader, removing them might not add great value.

Fair enough.

	Arnd
