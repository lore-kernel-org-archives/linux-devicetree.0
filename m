From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: I2C not working upon 2.6.24 to 2.6.28 kernel upgrade
Date: Thu, 12 Mar 2009 12:18:45 -1000
Message-ID: <49B98A45.8020304@firmworks.com>
References: <ba5d9360903121037m6d5be5e9m4b164d56bd6b5f3@mail.gmail.com>	<fa686aa40903121108p50338218w18714686d1f8bdbf@mail.gmail.com>
	<ba5d9360903121438p57e068b6n46e58868b814539c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <ba5d9360903121438p57e068b6n46e58868b814539c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Johns Daniel <johns.daniel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

>
> Binding on device_type or name is strongly discouraged, so the above
> > snippit isn't a good idea.
>   
>
> Would you please explain why? I just want to weigh the risk of
> changing the DTB vs. the risk of using a device_type binding.
>   


This has been discussed to death, but ...

The proper meaning of "device_type" is to tell Open Firmware that the 
device node contains a specific set of methods that implements a 
specific API that the firmware can for internal purposes like, for 
example, a console.

People have tried to co-opt it for other uses, but doing so just makes 
its meaning ambiguous, thus making it difficult to use for any purpose.

The "compatible" property is specifically intended for driver selection.
