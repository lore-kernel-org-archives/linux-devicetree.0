From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [RFC PATCH v2 0/1] of: easier debugging for node life cycle issues
Date: Tue, 23 Jan 2018 23:11:18 +1100
Message-ID: <874lncwza1.fsf@concordia.ellerman.id.au>
References: <20180121143117.19805-1-wsa+renesas@sang-engineering.com> <ac4f02e1-6d49-158a-4fb6-56ac0d474a44@gmail.com> <20180122114948.mm5mg6zqw3hmjj4o@katana>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20180122114948.mm5mg6zqw3hmjj4o@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Frank Rowand <frowand.list@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, linux-renesas-soc@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Wolfram Sang <wsa@the-dreams.de> writes:

> Hi Frank,
>
>> Please go back and read the thread for version 1.  Simply resubmitting a
>> forward port is ignoring that whole conversation.
>> 
>> There is a lot of good info in that thread.  I certainly learned stuff in it.
>
> Yes, I did that and learned stuff, too. My summary of the discussion was:
>
> - you mentioned some drawbacks you saw (like the mixture of trace output
>   and printk output)
> - most of them look like addressed to me? (e.g. Steven showed a way to redirect
>   printk to trace)
> - you posted your version (which was, however, marked as "not user friendly"
>   even by yourself)
> - The discussion stalled over having two approaches
>
> So, I thought reposting would be a good way of finding out if your
> concerns were addressed in the discussion or not. If I overlooked
> something, I am sorry for that. Still, my intention is to continue the
> discussion, not to ignore it. Because as it stands, we don't have such a
> debugging mechanism in place currently, and with people working with DT
> overlays, I'd think it would be nice to have.

Yeah I agree with all of that, I didn't think there were really any
concerns left outstanding. These trace points are very useful, I've
twice added them to a kernel to debug something, so it would be great
for them to be in mainline.

cheers
