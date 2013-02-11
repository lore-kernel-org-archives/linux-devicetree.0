From: Anatolij Gustschin <agust@denx.de>
Subject: Re: [PATCH 2/2] powerpc/5200: Use the gpt* labels to simplify
 mpc5200 dts files
Date: Mon, 11 Feb 2013 22:55:29 +0100
Message-ID: <20130211225529.7ac05eca@crub>
References: <1360310571-31494-1-git-send-email-grant.likely@secretlab.ca>
	<1360310571-31494-2-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1360310571-31494-2-git-send-email-grant.likely@secretlab.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linuxppc-dev@list.ozlabs.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Fri,  8 Feb 2013 08:02:51 +0000
Grant Likely <grant.likely@secretlab.ca> wrote:

> The DTC labels feature allows a dts file to reference a node without
> having to reproduce the entire node hierarchy above it. We can use this
> to simplify the MPC5200 board dts files by referencing the gpt nodes by
> label.
> 
> Cc: Anatolij Gustschin <agust@denx.de>
> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> ---
>  arch/powerpc/boot/dts/a3m071.dts    |    6 ++--
>  arch/powerpc/boot/dts/a4m072.dts    |   27 ++++--------------
>  arch/powerpc/boot/dts/cm5200.dts    |    6 ++--
>  arch/powerpc/boot/dts/digsy_mtc.dts |   14 ++--------
>  arch/powerpc/boot/dts/media5200.dts |    6 ++--
>  arch/powerpc/boot/dts/motionpro.dts |   26 ++++++++----------
>  arch/powerpc/boot/dts/mucmc52.dts   |   48 ++++++++------------------------
>  arch/powerpc/boot/dts/o2d.dtsi      |   25 +++++------------
>  arch/powerpc/boot/dts/pcm030.dts    |   48 ++++++--------------------------
>  arch/powerpc/boot/dts/pcm032.dts    |   45 ++++++------------------------
>  arch/powerpc/boot/dts/uc101.dts     |   52 ++++++-----------------------------
>  11 files changed, 69 insertions(+), 234 deletions(-)

Applied, thanks!

Anatolij
