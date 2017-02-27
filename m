From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 1/1] devicetree: of_node_put() does not require holding
 devtree_lock
Date: Mon, 27 Feb 2017 12:08:52 +0200
Message-ID: <0a81cfa1-ec08-fbdb-9359-e2ee738af1dd@linux.intel.com>
References: <1487755758-6066-1-git-send-email-sakari.ailus@linux.intel.com>
 <58B343C6.9060604@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58B343C6.9060604-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Frank,

Frank Rowand wrote:
> Adding Rob.
>
> On 02/22/17 01:29, Sakari Ailus wrote:
>> While holding a reference to a device_node it is allowed to put that node
>> without holding devtree_lock spinlock. Move of_node_put() after releasing
>> the spinlock.
>
> Please explain why the change fixes or improves the code.  In other words,
> what is the point of the change?

The spinlock is simply not needed, that's all. I'd say generally moving 
code that does not require serialising out of a serialised section does 
improve the code, sometimes also the readability of the code, especially 
if it doesn't get more complicated as a result.

>
> Please use getmaintainer to find who to send the patch to.

I'll do that the next time.

-- 
Kind regards,

Sakari Ailus
sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
