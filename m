From: walter harms <wharms@bfs.de>
Subject: Re: [PATCH 1/7] drivers/macintosh/via-pmu-led.c: Add of_node_put
 to avoid memory leak
Date: Wed, 01 Sep 2010 17:03:06 +0200
Message-ID: <4C7E6B2A.6030907@bfs.de>
References: <1283075566-27441-1-git-send-email-julia@diku.dk> <1283075566-27441-2-git-send-email-julia@diku.dk> <4C7D247F.4060500@bfs.de> <Pine.LNX.4.64.1008311807470.2668@ask.diku.dk> <20100831161644.GA14505@albatros> <AANLkTi=3b0NY5pFepv-TmjFDmPUBK9Ew16HyTn-+YguX@mail.gmail.com>
Reply-To: wharms@bfs.de
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=3b0NY5pFepv-TmjFDmPUBK9Ew16HyTn-+YguX@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Vasiliy Kulikov <segooon@gmail.com>, Julia Lawall <julia@diku.dk>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org



Grant Likely schrieb:
> On Tue, Aug 31, 2010 at 10:16 AM, Vasiliy Kulikov <segooon@gmail.com> wrote:
>> On Tue, Aug 31, 2010 at 18:08 +0200, Julia Lawall wrote:
>>> On Tue, 31 Aug 2010, walter harms wrote:
>>>>>   if (strncmp(model, "PowerBook", strlen("PowerBook")) != 0 &&
>>>>>       strncmp(model, "iBook", strlen("iBook")) != 0 &&
>>>>>       strcmp(model, "PowerMac7,2") != 0 &&
>>>>>
>>>> is there any rule that says when to use strncmp ? it seems perfecly valid to use strcpy here
>>>> (what is done in the last cmp).
>>> Perhaps there are some characters after eg PowerBook that one doesn't want
>>> to compare with?
>> It seems to me that model has no '\0' in the end. If model is got from
>> the hardware then we should double check it - maybe harware is buggy.
>> Otherwise we'll overflow model.
> 
> Model does have \0 at the end.  This code is using strncmp to
> purposefully ignore the model suffix.
> 
>> But why strcmp(model, "PowerMac7,2")? IMO it should be replaced
>> with strncmp().
> 
> We use strcmp when parsing the device tree because the the length of
> the model property string is unknown and in most cases we *must* match
> the exact entire string, such as with this PowerMac7,2 example.  Using
> strncmp would also happen to match with something like
> "PowerMac7,2345" which is not the desired behaviour.
> 

hi Grant,
whould you mind to use you explanation as comment in the code ?
Tthat the strncpy/strcpy difference is important should be noted. that would be clearly a
bonos with further audits.

re,
 wh
