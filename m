From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [Arm-netbook] getting allwinner SoC support upstream (was Re:
 Uploading linux (3.9.4-1))
Date: Thu, 6 Jun 2013 08:05:08 -0700
Message-ID: <CAOesGMgukawVUN978xQARwOWBEhVQQXCPKYQ2eua8yAVgH5HCg@mail.gmail.com>
References: <CAPweEDx3mAy40BZrzrKPRbvg7vKMj7KevDQ3m_v4p6Yo50eSGg@mail.gmail.com>
 <1370475609.20454.44.camel@localhost>
 <CAPweEDwS3tR=wh-bZJb3vqR8fVQra=3XxDitowGRdH9c7WRfmQ@mail.gmail.com>
 <1733666.lHUBcfUXq9@flatron>
 <CAPweEDzYLDzh_-OWU61dtVhajZ40QpQgZKHFYDsh3FgF=r9_ag@mail.gmail.com>
 <20130606140250.GA4839@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130606140250.GA4839-AKGzg7BKzIDYtjvyW6yDsg@public.gmane.org>
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
To: Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org>, "luke.leighton" <luke.leighton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux on small ARM machines <arm-netbook-Fj0DB6SUpRXNuVmtMlwsDbVCufUGDwFn@public.gmane.org>, devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, debian-arm-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org, "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, debian-kernel-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Jun 6, 2013 at 7:02 AM, Theodore Ts'o <tytso-3s7WtUTddSA@public.gmane.org> wrote:
> On Thu, Jun 06, 2013 at 01:24:57PM +0100, luke.leighton wrote:
>> On Thu, Jun 6, 2013 at 1:01 AM, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> > I don't see any other solution here than moving all the Allwinner code to
>> > DT (as it has been suggested in this thread several times already), as
>> > this is the only hardware description method supported by ARM Linux.
>>
>>  i repeat again: please state, explicitly and unequivocably that you -
>> linux kernel developers - are happy that the reach of linux and
>> gnu/linux OSes is dramatically reduced due to this intransigent
>> position.
>
> But that's not a true statement.  You've said that Allwinner is
> perfectly happy to carry code out of tree, by constantly porting their
> hacks from mainline kernels.
>
> For some of their customers, this will be acceptable to them.  In
> those cases, Linux will still be in use.  Great!  So claiming that the
> reach of Linux will be "dramatically reduced" just is not a
> supportable position.
>
> For other (potential) customers, for whom mainline kernel support is
> critically important, they will choose other hardware solutions that
> are in the mainline kernel.
>
> I don't see the problem here.

This is all just a big storm in a cup. Mainline kernel support for
allwinner SoCs are already happening through hobby development by
Maxime Ripard and others. Allwinner are not yet actively
participating, but they're aware of it. The whole situation is a
non-issue.

If the vendor prefers to keep carrying their own code for a while,
they're free to. It makes more sense for them to move over to the
upstream code as they move forward with their kernel versions, but
they can do that on their own schedule.

We've seen all this before, it tends to turn out OK in the longer run.


-Olof
