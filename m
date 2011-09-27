From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: vic: MULTI_IRQ_HANDLER handler
Date: Tue, 27 Sep 2011 14:58:08 +0100
Message-ID: <20110927135808.GB15913@pulham.picochip.com>
References: <1317125802-14386-1-git-send-email-jamie@jamieiles.com>
	<1317125802-14386-2-git-send-email-jamie@jamieiles.com>
	<4E81CECA.6050306@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4E81CECA.6050306-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Sep 27, 2011 at 08:25:30AM -0500, Rob Herring wrote:
> On 09/27/2011 07:16 AM, Jamie Iles wrote:
> > Add a handler for the VIC that is suitable for MULTI_IRQ_HANDLER
> > platforms.  This only works for platforms with CONFIG_OF=y as we can
> > determine which controllers are the primary controllers (no parent).
> 
> That's probably not an acceptable limitation. I guess this is hard-wired
> into entry-macro.S files currently? Perhaps adding an "is_root" flag to
> vic_init would fix it for non-DT.

OK.  Looking at all of the other users of the common vic code, I can't 
find an instance where the vic isn't the top level controller.  So I 
think that restriction can be removed and in the device tree probing 
issue a WARN() if parent != NULL.  Does that work for you?

Jamie
