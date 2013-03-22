From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH V2 2/2] of: remove /proc/device-tree
Date: Fri, 22 Mar 2013 23:44:30 +0000
Message-ID: <CACxGe6vg2iya7yo_sCfK9HuisJy0-KN9WR-jUO4nZh-A2A+m4Q@mail.gmail.com>
References: <1363865097-32764-1-git-send-email-grant.likely@secretlab.ca>
 <1363865097-32764-3-git-send-email-grant.likely@secretlab.ca>
 <1363870366.3312.1.camel@pasglop> <CACxGe6vSywW_iekAKmDMf5_TLLt5Hn+Jttq8kddq3vJ=AE+DQA@mail.gmail.com>
 <CACxGe6uCKRH8jcGJW+oYt+T33XT_MGzaxmtkNdekMooGqBYTEw@mail.gmail.com>
 <514C9CF1.7060505@linux.vnet.ibm.com> <1363980558.11644.8.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363980558.11644.8.camel@pasglop>
Sender: linux-kernel-owner@vger.kernel.org
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Nathan Fontenot <nfont@linux.vnet.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>, David Miller <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 22, 2013 at 7:29 PM, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Fri, 2013-03-22 at 13:03 -0500, Nathan Fontenot wrote:
>> We don't ever free old property values, mainly I assume since we don't keep
>> reference counts and can't know when it is safe to do so. The problem I
>> am starting to see on pseries is that we are getting very large properties.
>> One of the biggest culprits is the property on pseries systems to describe
>> the memory on the system in the device tree. These are big and getting
>> bigger as memory increases, additionally this property is update every
>> time memory is DLPAR added or removed from the system which can lead to
>> leaving a bunch of memory that should be free'ed.
>>
>> Given that, is there (or has there been) any discussion on adding reference
>> counts to properties in the device tree? With the myriad ways to get at
>> the value of a property this may not be feasible but I would like to hear
>> any thoughts from the community.
>
> My assumption was always that the lifetime of property values is tied
> the the lifetime of the node they are in. IE, we wouldn't free a
> property removed from a node but we could free all properties when
> the node goes away...
>
> Not the best but would do...
>
> refcount of properties, well ... Grant, do we get kobjects for them with
> the sysfs stuff ? That could do the trick...

No. Kobjects are only created for the nodes.

g.
