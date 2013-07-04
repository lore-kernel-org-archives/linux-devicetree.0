From: Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Appended DTB files for multi-machine kernels
Date: Thu, 04 Jul 2013 18:56:24 +0200
Message-ID: <51D5A938.30607@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sven Neumann <s.neumann-5g8ninUHluJWk0Htik3J/w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

I'm facing a problem with a transition from legacy board-file driven ARM
machines to DTB, and I'm under the impression that a solution for it
could be of broader interest.

In short, devices that have been deployed in quantities come in three
hardware variants, which all boot with a unique machine-id. We ship
kernel images that have board support for all three machine types, and
do minor fixups to platform data of some drivers at runtime, depending
on the board revision number (passed in via ATAGs).

The built-in support for attaching a DTB to the zImage does not suffice
here, because we have one image for all models, and also, we couldn't do
a 'per-board-revision' selection that way either.

Unless I missed some recent discussion, this case is not easy to handle.
Yes, I know that these kind of things should be handled by a
next-generation bootloader, but in our case, we want to avoid a loader
update of already shipped hardware by all means.

As a solution, I'm thinking of a small framework that could for example
work as follows.

a) A small mechanism allows storing multiple DTB binary files inside the
kernel binary at compile time, and a simple function can extract them
again by name at runtime (something like what the firmware framework
does, but I don't know if that one can be used at such an early stage in
the boot process).

b) A DT_MACHINE_START-like macro takes both the machine ID and the name
of a DTB file that is compiled in. When matched, generic functions would
load the given file, populate the device tree and then conduct a generic
DT boot for the specified platform.

c) Allow users to open-code the DTB lookup depending on whatever kind of
runtime information (be it the board_revision or anything else).


Of course, everything has to be an opt-in that stubs itself out at zero
costs if not needed.


I'm open to opinion and sugesstions :)


Thanks,
Daniel
