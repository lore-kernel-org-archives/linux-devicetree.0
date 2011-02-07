From: Amit Kucheria <amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Device Tree on ARM status report
Date: Mon, 7 Feb 2011 10:46:13 +0200
Message-ID: <20110207084613.GC2723@matterhorn.lan>
References: <AANLkTikLvO0Y44nCxEfCsNxU-Na+PzcLXZUjOsMUM1_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <AANLkTikLvO0Y44nCxEfCsNxU-Na+PzcLXZUjOsMUM1_A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linaro-dev <linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11 Feb 05, Grant Likely wrote:
> Hi all,
> 
> With several more engineers working on ARM device tree support, I'm
> going to start collecting the status of all the work that is going on
> (and I know about) and posting it in a regular status report,
> hopefully weekly, for the next few months until the all of the major
> features are implemented and working on several arm platforms.  I'll
> try to use roughly the following format:
> 
> 1) latest news and status updates
> 2) list of tasks with current state and who is responsible for them in
> the same format as Launchpad blueprint whiteboards[1]. (In fact, I'll
> probably move much, if not all, of this into Launchpad anyway, in
> which case these emails will be a summary of all the blueprints. not
> all of us work with Linaro, but it is a useful method for tracking
> progress).
> 3) List of active engineers
> 
> [1] https://wiki.linaro.org/Process/Blueprints
> 
> Please read through and reply with comments/corrections.  Feel free to
> add or remove tasks from the list I've given below.
> 
> Thanks,
> g.
> 
> 
> 1 - Latest news
> ---------------
> - devicetree/arm on git://git.secretlab.ca/git/linux-2.6 has
> everything needed to turn on basic device tree support for any
> platform.
> - Similarly, u-boot just needs to have the CONFIG_OF_LIBFDT defined to
> turn on device tree support.
> - IRQ handling is still a problem and only one interrupt controller
> can be supported at the moment, but Lennert is working on a solution.
> - I've posted a patch that will allow dt and non-dt device
> registration to co-exist peacefully by snooping platform device
> registrations.  I could use some feedback and testing.
> - hopefully the basic dt support can be merged into Nicolas' tree this
> week if I get a cleaned up branch pushed out for him quickly.
> 
> 2 - Task status
> ---------------
> Core infrastructure:
> [glikely] basic infrastructure to enable dt: DONE
> [r-herring] Allow dtb to be located anywhere in RAM: DONE
> [bones] Debug dtb corruption during init: INPROGRESS
> [glikely] OF clock bindings: INPROGRESS

Does this include the common clock framework that Jeremy had been working on?
I see no mention of that explicitly, hence the question.

Regards,
Amit
