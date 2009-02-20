From: ron minnich <rminnich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [coreboot] DTS syntax and DTC patches (was: Re: [Qemu-devel]
	[RFC] Machine description as data)
Date: Thu, 19 Feb 2009 19:32:41 -0800
Message-ID: <13426df10902191932x12ab0614g50bb4c4f5020e657__46031.3241499991$1235101242$gmane$org@mail.gmail.com>
References: <87iqnh6kyv.fsf@pike.pond.sub.org>
	<20090212040138.GD31142@yookeroo.seuss>
	<87iqng0x3t.fsf@pike.pond.sub.org>
	<20090213004305.GB8104@yookeroo.seuss> <4994D6C8.5050004@gmx.net>
	<20090213021704.GA10476@yookeroo.seuss> <4994DED9.6020803@gmx.net>
	<20090213025101.GC10476@yookeroo.seuss>
	<13426df10902130907m5c3452dpb8f4f2b72f8507b9@mail.gmail.com>
	<20090220022918.GA18332@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <20090220022918.GA18332-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: ron minnich <rminnich-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006-hi6Y0CQ0nG0@public.gmane.org>, Coreboot <coreboot-7ChRSZmxDtxg9hUCZPvPmw@public.gmane.org>, Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hollis
List-Id: devicetree@vger.kernel.org

On Thu, Feb 19, 2009 at 6:29 PM, David Gibson <dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org> wrote:

> Hrm, I see.  So, if we added the ability to list properties multiple
> times, with the last definition overriding earlier ones, then I
> believe that, along with include files, which are already supported
> would accomplish what you have implemented with /config/.  Does that
> seem correct?


That ought to do it.

>
>> Restrict we have; change property values from a default.
>> Add is what we'd like: add a node to a tree in some way.
>> Remove we would also like: remove a node from a dts we have read in
>> via /config/.
>
> Hrm.  Well, this sort of thing is certainly on the cards with the
> expression support stuff we had in mind.


Would be just what we need.

Thanks

ron
