From: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
Subject: Re: [PATCH v3 RESEND] watchdog: Add driver for Altera
	Watchdog	Timer
Date: Tue, 14 Jun 2011 15:48:59 +0200
Message-ID: <20110614134859.GP20966@distanz.ch>
References: <1300461573-12268-1-git-send-email-tklauser@distanz.ch>
	<20110527082309.GB16394@infomag.iguana.be>
Reply-To: nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nios2-dev-bounces-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110527082309.GB16394-flHiHfN8CTwhDM6iD19NGrNAH6kLmebB@public.gmane.org>
List-Unsubscribe: <http://sopc.et.ntust.edu.tw/cgi-bin/mailman/options/nios2-dev>,
	<mailto:nios2-dev-request-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sopc.et.ntust.edu.tw/pipermail/nios2-dev>
List-Post: <mailto:nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org>
List-Help: <mailto:nios2-dev-request-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org?subject=help>
List-Subscribe: <http://sopc.et.ntust.edu.tw/cgi-bin/mailman/listinfo/nios2-dev>,
	<mailto:nios2-dev-request-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org?subject=subscribe>
Sender: nios2-dev-bounces-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org
Errors-To: nios2-dev-bounces-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org
To: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
Cc: nios2-dev-1eJk0qcHJCcaeqlQEoCUNoJY59XmG8rH@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Wim

On 2011-05-27 at 10:23:09 +0200, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org> wrote:
> > This driver adds support for the Altera Timer in the Watchdog Timer
> > configuration. This component is usually found on SOPC (System on
> > Programmable Chip) for Altera FPGAs.
> > 
> > Signed-off-by: Tobias Klauser <tklauser-93Khv+1bN0NyDzI6CaY1VQ@public.gmane.org>
> > Reviewed-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
> > Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> (for the devicetree binding)
> 
> Signed-off-by: Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>
> 
> I presume this will go in together with the other nios2 architecture patches?

It will probably take some time until we get to the point where we're
ready to submit nios2 arch patches. We started out with individual
drivers to get used to the submission and review process. Most of them
got taken by the respective subsystem maintainers.

So if you want to take the driver through your tree, please go ahead.
Otherwise I will resubmit it once we're ready to submit the nios2 arch.

Cheers
Tobias
