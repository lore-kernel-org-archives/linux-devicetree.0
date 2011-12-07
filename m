From: Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH] RFC, watchdog: add generic wdt driver API
Date: Wed, 07 Dec 2011 07:37:18 +0100
Message-ID: <4EDF099E.80207@denx.de>
References: <1322992423-21683-1-git-send-email-hs@denx.de>
 <20111204125928.GB5788@pengutronix.de>
 <20111204170810.8370625EA22@gemini.denx.de>
 <20111205122649.6fc6aed2@lxorguk.ukuu.org.uk>
Reply-To: hs-ynQEQJNshbs@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <20111205122649.6fc6aed2-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Detlev Zundel <dzu-ynQEQJNshbs@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stefan Roese <sr-ynQEQJNshbs@public.gmane.org>, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Alan,

Alan Cox wrote:
>> that we have a number of customers who consider the existing wdt
>> support unsufficient for their use cases.  We've been using it on all
>> kinds on PPC systems, and now on ARM as well.
>>
>> We will not fight for inclusion of this driver, we just wat to know if
>> it's worth investing efforts to get it accepted or if this is a lost
>> case.
> 
> I think it would be better to start from the needed feature list than the
> implementation of an old and wildly different pile of code. Then discuss
> adding those features that are relevant to the current framework - which
> ought to be relatively easy now each watchdog is a set of methods.

Ok, I try to describe the needed new features called in the old
driver code Chain API:

  The chain API is used to register configurable "watchdog chains" from
  either user or kernel space.  A watchdog chain is identified by an
  unsigned integer and can contain up to three action stages. Configured
  through ioctl().

  A "time interval" in seconds and an "action" is associated with each
  stage.  When the chain is not reset before the interval elapses, the
  associated action is triggered and the chain moves on to the next stage.

  A chain can request to kill the registering process if the interval
  elapses.  In this case a restarted process can register with the
  driver giving the same identifier and reset the chain.  This is the
  main reason why there is no association between chains and processes
  or open device files.

  Possible chain actions:
  - ACTION_SIGNAL: sends a configurable signal to the process
  - ACTION_KILL: sends the SIGKILL signal to the process
  - ACTION_REBOOT: tries a soft reboot
  - ACTION_RESET: triggers a hard-reset

  ioctl calls:
  - WD_REGISTER: register a chain

    The parameter given to the call is a pointer to a structure with
    the following layout:

    struct wd_param {
      unsigned chainid;
      unsigned long timer_count[3];
      int action[3];
      int signal;
    } wd_param;

    Each stage is configured with entries in the arrays "timer_count"
    and "action."

    The timer_count contains the length of the interval in seconds
    while action contains one of the above described ACTION_* constants.

    A timer_count of zero signals the end of the chain.

  - WD_RESET:
    This call resets the chain denoted by the unsigned integer
    passed to it.  When reset, a chain will expire beginning with
    stage zero again.

  - WD_UNREGISTER:
    As closing the device file will not have any effect on chains,
    a process must unregister a chain if the service is no longer
    needed. This can be done with this ioctl taking an unsigned
    integer as a parameter denoting the chain with the same chainid
    to be unregistered.

Has such a framework a chance to go in mainline? What would be a good
starting point to integrate it? As this "chain API" would controlled
through ioctl() calls maybe drivers/watchdog/watchdog_dev.c would be
a good place... or a drivers/watchdog/watchdog_chain.c which gets the
ioctl calls, watchdog_dev.c couldn't parse ...

bye,
Heiko
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
