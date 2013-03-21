From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 2/2] of: remove /proc/device-tree
Date: Thu, 21 Mar 2013 07:35:11 +0000
Message-ID: <CACxGe6sXcg51VhFujsjCsMzF80pdy_QhAposdmya4-C0eEcuUw@mail.gmail.com>
References: <1363791074-16415-1-git-send-email-grant.likely@secretlab.ca>
 <1363791074-16415-3-git-send-email-grant.likely@secretlab.ca>
 <1363791479.12701.9.camel@pasglop> <CACxGe6u2wNbPQSOPRCRO0To5UC-b8rXYanv2xv26hk5oaozvPA@mail.gmail.com>
 <1363839594.17680.19.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363839594.17680.19.camel@pasglop>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Thu, Mar 21, 2013 at 4:19 AM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Wed, 2013-03-20 at 21:38 +0000, Grant Likely wrote:
>> > NAK. It should at the very least be a CONFIG option for a while
>> before
>> > completely switching over.
>>
>> I'll modify patch 1 to create the symlink if CONFIG_PROC_DEVICETREE is
>> not set. After the first patch can be applied we can leave it for a
>> release or two before applying the second.
>
> Shouldn't we have the symlink just be a config option itself ?
> Eventually distros might want get rid of it completely ..

Why? It is the cheapest thing in the world and it means the ABI
doesn't change at all.

g.
