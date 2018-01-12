From: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Subject: Re: [PATCH v5 02/44] clk: davinci: New driver for davinci PLL clocks
Date: Fri, 12 Jan 2018 09:48:31 -0600
Message-ID: <c5cea4a3-0e52-d9ce-339b-b3dcd1be5a42@lechnology.com>
References: <1515377863-20358-1-git-send-email-david@lechnology.com>
 <1515377863-20358-3-git-send-email-david@lechnology.com>
 <7fc8bd35-0416-216d-8e1e-53a0ec6e8790@ti.com>
 <01fbde0e-36a0-2b19-e385-e63bc4a3ae4a@lechnology.com>
 <CAHCN7xK44_zv27xe5yxL8Efey=VC-nypK6hY6VWqsoLqnKe04g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHCN7xK44_zv27xe5yxL8Efey=VC-nypK6hY6VWqsoLqnKe04g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Adam Ford <aford173-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/12/2018 09:30 AM, Adam Ford wrote:
> On Fri, Jan 12, 2018 at 9:25 AM, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org> wrote:
>>
>> Yes, I noticed that I missed this after I submitted this series. And I
>> will have to rework things to coordinate with the PLL as mentioned above.
>>
>> FYI, I do have cpufreq-dt working, although the LEGO EV3 has a fixed 1.2V
>> regulator, so I am limited in what I can test. Basically, I can only switch
> 
> I can test the cpufreq-dt.  Are there additional patches or are they
> part of the same git repo I have been testing?
> 
> The DA850 I have may not run all the way to highest speed, but I'll
> see what I can find.  I think I had a few at one point, but I don't
> think it was part of Logic PD's standard product lineup.
> 

There are some extra patches I have not submitted yet. However, based on the
other comments here, I don't have things implemented correctly, so you probably
want to wait to test until I get that straightened out anyway.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
