From: Kumar Gala <galak-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: removing -S option from dtc?
Date: Wed, 30 Jul 2008 08:32:22 -0500
Message-ID: <7EE6D71E-3074-4DCF-A279-15E91825B0A7@kernel.crashing.org>
References: <9E2D1AC5-F98F-431B-9361-9EA4765785F9@kernel.crashing.org>
	<E1KOBRr-0002ku-UK@jdl.com> <E1KOBTw-0002lU-LL@jdl.com>
Mime-Version: 1.0 (Apple Message framework v926)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <E1KOBTw-0002lU-LL-CYoMK+44s/E@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


On Jul 30, 2008, at 8:12 AM, Jon Loeliger wrote:

>>> Jon,
>>>
>>> Any thoughts on removing the -S option from dtc.  It always seemed
>>> confusing to me and not sure if any really uses it.
>>>
>>> - k
>>
>> Well, not yet.
>
> Well, that was vague in its conciseness.
>
> I meant, it's not time to remove it yet.
> There are still plenty of lingering users that
> have not figured out U-Boot has improved yet.

I was thinking we'd keep -p (for padding) but remove -S (pad to a  
fixed size).

- k
