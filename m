From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 0/5] make sdhci device drivers self registered
Date: Mon, 21 Mar 2011 01:07:20 -0600
Message-ID: <AANLkTikmTBTPkAO9uHXtPDqEEheGJitwRKG1RFVDWrCx@mail.gmail.com>
References: <1300678938-8046-1-git-send-email-shawn.guo@linaro.org>
	<AANLkTimrJ3=GS-+o1vcBpMXg0Phwnu9SVgm0WA-Ck_sf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <AANLkTimrJ3=GS-+o1vcBpMXg0Phwnu9SVgm0WA-Ck_sf-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Mar 21, 2011 at 12:58 AM, Grant Likely
<grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Sun, Mar 20, 2011 at 9:42 PM, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>> This patch set is to take sdhci device driver specific things out
>> from sdhci-pltfm.c and make them self registered. Here are the
>> difference it makes.
>>
>> =A0* Get the sdhci device driver follow the Linux trend that driver
>> =A0 take the registration by its own
>> =A0* sdhci-pltfm.c becomes significantly simpler and only has common
>> =A0 support functions there
>> =A0* All sdhci device specific stuff are going back its own driver
>> =A0* The dt and non-dt support share the same pair of .probe and
>> =A0 .remove hooks.
>
> Fantastic! =A0Thanks for taking this on. =A0I'll make a few comments, but
> this series really needs to be reposted to both the linux-kernel and
> linux-mmc lists.
>

On a brief glance, it looks pretty good.  I need to take a deeper read
into it tomorrow, but in general I like the way this series is
looking.  If you do the reposting right away, then I can make my
comments on the linux-mmc list.

Also, don't forget to cc: samuel when you repost.

g.
