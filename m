From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [U-Boot] [PATCH] fdt: Enhance dts/Makefile to be all things to
 all men
Date: Wed, 29 May 2013 16:18:41 -0600
Message-ID: <51A67EC1.2000208@wwwdotorg.org>
References: <1369769778-12455-1-git-send-email-sjg@chromium.org>
 <51A51A50.4050308@wwwdotorg.org>
 <CAPnjgZ04BKhQtpJct9tvN8rW5Wae+6fxxOOQDnEkmgrr-mAfwg@mail.gmail.com>
 <51A62F8D.9010208@wwwdotorg.org> <20130529213145.698353831A5@gemini.denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130529213145.698353831A5-C2Gvrrd9BC/j/ljBK/0BTg@public.gmane.org>
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
To: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
Cc: u-boot-review <u-boot-review-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Rini <trini-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 05/29/2013 03:31 PM, Wolfgang Denk wrote:
> Dear Stephen,
> 
> In message <51A62F8D.9010208-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> you wrote:
>>
>> The Linux kernel chose to solve this by bundling the required dtc source
>> inside the kernel source tree as a tool. This seems by far the simplest
>> way to solve the problem for U-Boot too. If not, it's not exactly hard to:
> 
> Actually it's a horrible approach to fixing tool issues upstream.
> Or rather to NOT fixing issues.  Instead of pushing forward that
> distros distribute useful, recent versions we simply copy the dtc
> source.

I don't understand the hangup about the version of dtc that distros package.

Sure, it'd be nice if distros updated the the (currently) latest version
of dtc and packaged that, so that at some time the desired version was
there, and everything "just worked".

However, that's not going to outright solve the problem for a /long/ time.

What if someone wants to build U-Boot on Ubuntu 10.04 or RHEL 5. It
seems quite reasonable for someone to be using those for development
since they're long-term supported stable releases. Those releases don't
have the (current) latest version of dtc packaged, and it's exceedingly
unlikely anyone could push an update into those distros to update dtc,
since they're probably in bug-fix-only mode right now, and a dtc update
would be to add new features.

So, to cover that issue we must:

a) Get the latest dtc into distros right now. Wait until everyone has
updated. Then, we can use the new features. This could take many many years.

b) Simply require people to install dtc from source, if their distro
doesn't already package the desired version. This will immediately solve
the problem, and is honestly quite simple if you're already building
other things (U-Boot) from source.

I prefer option (b) here. And given that, I assert that whatever version
distros package is largely irrelevant, since there's a trivial
workaround if they don't have the desired version.

Longer-term distros will pick up a new version, and remove the need for
build-from-source, thus streamlining the process.

To keep this process in check a bit, we could always pick a specific git
commit or release version of dtc that each U-Boot version (release) will
be allowed to assume. That will limit the number of times people need to
update their locally-built dtc to at most once per U-Boot release.
Hopefully much less often.
