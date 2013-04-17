From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v2] of/base: release the node correctly in of_parse_phandle_with_args()
Date: Wed, 17 Apr 2013 23:00:22 +0100
Message-ID: <CACxGe6usVnOdcxELXWcqtuW-YVvDJmyyW+Ds8UQ1xpoCY+_WAg@mail.gmail.com>
References: <1365564999-24427-1-git-send-email-Yuantian.Tang@freescale.com>
 <D07C73A334FF604B95B3CBD2A545D07B0B144FD3@039-SN2MPN1-013.039d.mgd.msft.net>
 <20130417145719.F194E3E2B73@localhost> <CAOZdJXVnppPczrJi8jcNWLvabHFWP++Ex1QiEadbyLfApCR85g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOZdJXVnppPczrJi8jcNWLvabHFWP++Ex1QiEadbyLfApCR85g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Timur Tabi <timur@tabi.org>
Cc: Tang Yuantian-B29983 <B29983@freescale.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 17, 2013 at 10:52 PM, Timur Tabi <timur@tabi.org> wrote:
> On Wed, Apr 17, 2013 at 9:57 AM, Grant Likely <grant.likely@secretlab.ca> wrote:
>>
>>> I really preciate if you can spend some times to review this patch.
>>
>> Applied, thanks.
>
> Pff.  Why do I bother?

Relax Timur:

http://git.secretlab.ca/?p=linux.git;a=commitdiff;h=b855f16b05a697ac1863adabe99bfba56e6d3199

g.



--
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
