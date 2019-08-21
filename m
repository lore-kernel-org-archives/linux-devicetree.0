From: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v7 1/7] driver core: Add support for linking devices
 during device addition
Date: Wed, 21 Aug 2019 08:36:37 -0700
Message-ID: <915b49b5-5511-afa2-d3d6-e4ede94d40be@gmail.com>
References: <20190724001100.133423-1-saravanak@google.com>
 <20190724001100.133423-2-saravanak@google.com>
 <32a8abd2-b6a4-67df-eee9-0f006310e81e@gmail.com>
 <CAGETcx8Q27+Jnz+rHtt33muMV6U+S3cmKh02Ok_Ds_ZzfBqhrg@mail.gmail.com>
 <522e8375-5070-f579-6509-3e44fe66768e@gmail.com>
 <CAGETcx-9Bera+nU-3=ZNpHqdqKxO0TmNuVUsCMQ-yDm1VXn5zA@mail.gmail.com>
 <a4c139c1-c9d1-3e5a-f47f-cd790b42da1f@gmail.com>
 <CAGETcx-J7+d3pcArMZvO5zQbUhAhRW+1=FUf7C1fV9-QhkckBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGETcx-J7+d3pcArMZvO5zQbUhAhRW+1=FUf7C1fV9-QhkckBw@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, David Collins <collinsd@codeaurora.org>, Android Kernel Team <kernel-team@android.com>
List-Id: devicetree@vger.kernel.org

On 8/20/19 3:10 PM, Saravana Kannan wrote:
> On Mon, Aug 19, 2019 at 9:25 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>
>> On 8/19/19 5:00 PM, Saravana Kannan wrote:
>>> On Sun, Aug 18, 2019 at 8:38 PM Frank Rowand <frowand.list@gmail.com> wrote:
>>>>

< snip >

>>>
>>> 3. The supplier info doesn't always need to come from a firmware. So I
>>> don't want to limit it to that?
>>
>> If you can find another source of topology info, then I would expect
>> that another set of fwnode_operations functions would be created
>> for the info source.
> 
> The other source could just be C files in the kernel. Using fwnodes
> for that would be hacky. But let's sort (1) and (2) out first.
> 

< snip >

Just a piece of trivia.  I got curious enough about this to search.
There is a third type of fwnode, software nodes.

See commit 59abd83672f70cac4b6bf9b237506c5bc6837606 for a description.

-Frank
