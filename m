From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH v2 0/1] of: easier debugging for node life cycle
 issues
Date: Thu, 25 Jan 2018 16:46:06 -0800
Message-ID: <4b373579-7a86-6883-2624-12a5408bb49b@gmail.com>
References: <20180121143117.19805-1-wsa+renesas@sang-engineering.com>
 <00fc90ee-de26-f819-9c81-27d06918564d@gmail.com>
 <20180125060330.781667e9@vmware.local.home>
 <a30d4cd3-0068-8cca-cc2f-ca207d0d278b@gmail.com>
 <20180125231443.44yy65ztr6exaam7@ninjato>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180125231443.44yy65ztr6exaam7@ninjato>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Wolfram Sang <wsa+renesas-jBu1N2QxHDJrcw3mvpCnnVaTQe2KTcn/@public.gmane.org>, Steven Rostedt <rostedt-nx8X9YLhiw1AfugRpC6u6w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tyrel Datwyler <tyreld-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/25/18 15:14, Wolfram Sang wrote:
> 
>> This means that ftrace can not be used for the of_node_get(),
>> of_node_put(), and of_node_release() debug info, because
>> these functions are called before early_initcall().
> 
> For the record: You can still unbind/bind devices. This is how I
> debugged an issue.

I wasn't implying that the data wasn't usable for any use case.

The point is that using ftrace means there are use cases for the
debug information where the information will not be available.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
