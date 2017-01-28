From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Documentation: dt-bindings: tmp007: Add optional
 interrupt support
Date: Sat, 28 Jan 2017 11:53:22 +0000
Message-ID: <4176fa77-a935-72ce-a61f-f91f4c24ed63@kernel.org>
References: <20170123162809.GA16800@gmail.com>
 <20170127203050.ah52xd5hpxyo6ojq@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170127203050.ah52xd5hpxyo6ojq@rob-hp-laptop>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Manivannan Sadhasivam <manivannanece23-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 27/01/17 20:30, Rob Herring wrote:
> On Mon, Jan 23, 2017 at 09:58:09PM +0530, Manivannan Sadhasivam wrote:
>> This patch adds optional interrupt binding support for TI TMP007 - IR thermopiler sensor
>>
>> Signed-off-by: Manivannan Sadhasivam <manivannanece23-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>
>> Created separate patch for devicetree and driver.
>>
>>  Documentation/devicetree/bindings/iio/temperature/tmp007.txt | 8 ++++++++
>>  1 file changed, 8 insertions(+)
> 
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> 
Applied to the togreg branch of iio.git - shortly to be pushed out as testing
for the autobuilders to play with it.

Please cc linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org even when you are only touching the bindings.
Makes it less likely a patch will fall through the cracks!

Jonathan
