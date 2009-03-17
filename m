From: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: I2C not working upon 2.6.24 to 2.6.28 kernel upgrade
Date: Tue, 17 Mar 2009 13:36:30 -0500
Message-ID: <49BFEDAE.9000600@freescale.com>
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

Johns Daniel wrote:
> But I can assure you that I have been using this with 2.6.20 and
> 2.6.24 without any problems---and there has not been a compatible
> value in the soc node. (There are compatible values in the subnodes of
> soc.) Even with linux 2.6.28, everything but I2C works.

Most likely, i2c was a platform-bus driver in 2.6.24 and was converted 
to an of-platform-bus driver sometime between then and 2.6.28.  It 
wasn't that of-platform worked before, but rather you weren't using it.

-Scott
