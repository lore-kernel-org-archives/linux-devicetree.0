From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 09/18] ASoC: sti: Update DT example to match the driver
 code
Date: Tue, 26 Apr 2016 12:02:29 +0100
Message-ID: <20160426110229.GA5374@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1461236675-10176-1-git-send-email-peter.griffin@linaro.org>
 <1461236675-10176-10-git-send-email-peter.griffin@linaro.org>
 <20160421155753.GS3217@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160421155753.GS3217-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Mark,

On Thu, 21 Apr 2016, Mark Brown wrote:

> On Thu, Apr 21, 2016 at 12:04:26PM +0100, Peter Griffin wrote:
> > uniperiph-id, version and mode are ST specific bindings and
> > need the 'st,' prefix. Update the examples, as otherwise copying
> > them yields a runtime error parsing the DT node.
> 
> I'm not sure what connection this or the other ASoC documentation update
> have to the rest of the series?

The ASoC DT bindings are missing upstream as the ASoC driver depends on the
fdma driver. So this series adds the fdma driver, fdma dt bindings,
and also the missing ASoC dt bindings.

Whilst doing this and getting it working I noticed a few discrepencies
in the ASoC dt binding documentation versus the driver so also fixed that.

Once this whole series is applied the end result is working
audio upstream for STi platforms (as ASoC is the only upstream driver
using fdma currently).

regards,

Peter.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
