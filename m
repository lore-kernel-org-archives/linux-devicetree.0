From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v8 2/2] iio: Add AS3935 lightning sensor support
Date: Sat, 15 Mar 2014 15:00:17 +0000
Message-ID: <53246B01.7050204@kernel.org>
References: <1394628794-7598-1-git-send-email-mranostay@gmail.com> <1394628794-7598-3-git-send-email-mranostay@gmail.com> <201403130309.32474.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201403130309.32474.marex-ynQEQJNshbs@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pantelis.antoniou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 13/03/14 02:09, Marek Vasut wrote:
> On Wednesday, March 12, 2014 at 01:53:14 PM, Matt Ranostay wrote:
>> AS3935 chipset can detect lightning strikes and reports those back as
>> events and the estimated distance to the storm.
>>
>> Signed-off-by: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Reviewed-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
I'm not 100% happy with sensor_sensitivity but don't have a better idea.
As it is device specific lets leave it be for now.   Should we come
up with a better idea later it isn't much extra code to keep supporting
this interface going forwards.

Applied to the togreg branch of iio.git (pushed out initially as testing)

Thanks,

Jonathan
