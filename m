From: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH v3 RESEND] watchdog: Add driver for Altera Watchdog Timer
Date: Fri, 1 Jul 2011 10:31:22 +0200
Message-ID: <20110701083122.GA8678@infomag.iguana.be>
References: <1300461573-12268-1-git-send-email-tklauser@distanz.ch>
	<20110527082309.GB16394@infomag.iguana.be>
	<20110614134859.GP20966@distanz.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110614134859.GP20966-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Cc: nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Tobias,

> > I presume this will go in together with the other nios2 architecture patches?
> 
> It will probably take some time until we get to the point where we're
> ready to submit nios2 arch patches. We started out with individual
> drivers to get used to the submission and review process. Most of them
> got taken by the respective subsystem maintainers.
> 
> So if you want to take the driver through your tree, please go ahead.
> Otherwise I will resubmit it once we're ready to submit the nios2 arch.

Just let me know when you are ready to submit the nios2 arch and then I will do
the necessary on my side. In the mean time I will add your driver to the
linux-2.6-watchdog-next tree in some form, but I might convert the driver first
to the generic watchdog framework.

Kind regards,
Wim.
