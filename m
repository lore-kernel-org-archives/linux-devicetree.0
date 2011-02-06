From: Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Device Tree on ARM status report
Date: Sun, 6 Feb 2011 19:06:24 +0530
Message-ID: <AANLkTi=kXCyiBLz8hg92WTg2hz+xTu0P5p-F61xscY4p@mail.gmail.com>
References: <AANLkTikLvO0Y44nCxEfCsNxU-Na+PzcLXZUjOsMUM1_A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
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

On 6 February 2011 10:12, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> Hi all,
>
> With several more engineers working on ARM device tree support, I'm
> going to start collecting the status of all the work that is going on
> (and I know about) and posting it in a regular status report,
> hopefully weekly, for the next few months until the all of the major
> features are implemented and working on several arm platforms. =A0I'll
> try to use roughly the following format:

<snip>

> Samsung S5PV310 tasks:
> [thomas-ab] enable dtb support in u-boot: DONE?

The dtb support in u-boot has been enabled but that has been done in
my copy of u-boot. The linaro u-boot does not include support for
s5pv310 yet.

> [thomas-ab] enable basic kernel dtb support on S5PV310: DONE?

Done and tested.

> [thomas-ab] make gpio driver dt-aware: TODO

Will do this as next task.

> [thomas-ab] Register devices from dt: INPROGRESS
> ... add more details here, specific devices, etc...

The watchdog timer driver was modified to be probed from device tree
and it is working fine (will work for both dt and non-dt versions).
Other work items that will be taken up next are

- Retrieve the default UART register values from the device tree
during UART initialization.
- Add SDHCI_OF support for SDHCI s3c driver, required to support DT
enabled sdhci driver for s5pv310
- Initialize timer and GIC from dt.
- Support dt for gpio, i2c, spi, uart, srom controller.

Thanks,
Thomas.

<snip>
