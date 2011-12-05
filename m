From: Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Subject: Re: [PATCH] RFC, watchdog: add generic wdt driver API
Date: Mon, 5 Dec 2011 12:26:49 +0000
Message-ID: <20111205122649.6fc6aed2@lxorguk.ukuu.org.uk>
References: <1322992423-21683-1-git-send-email-hs@denx.de>
 <20111204125928.GB5788@pengutronix.de>
 <20111204170810.8370625EA22@gemini.denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111204170810.8370625EA22-C2Gvrrd9BC/j/ljBK/0BTg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
Cc: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> that we have a number of customers who consider the existing wdt
> support unsufficient for their use cases.  We've been using it on all
> kinds on PPC systems, and now on ARM as well.
> 
> We will not fight for inclusion of this driver, we just wat to know if
> it's worth investing efforts to get it accepted or if this is a lost
> case.

I think it would be better to start from the needed feature list than the
implementation of an old and wildly different pile of code. Then discuss
adding those features that are relevant to the current framework - which
ought to be relatively easy now each watchdog is a set of methods.

Alan
