From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [v4,2/3] drivers: hwmon: Add W83773G driver
Date: Thu, 23 Nov 2017 01:01:10 -0800
Message-ID: <3f12394e-d086-43b6-9cff-da2e93aaa02d@roeck-us.net>
References: <1510543655-27059-3-git-send-email-mine260309@gmail.com>
 <20171118161533.GA2810@roeck-us.net>
 <CACPK8Xc5zmHCmDikYFPA+GdVCydHwgiLMY0X1RTyOmzS+m9W7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACPK8Xc5zmHCmDikYFPA+GdVCydHwgiLMY0X1RTyOmzS+m9W7A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Lei YU <mine260309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jean Delvare <jdelvare-IBi9RG/b67k@public.gmane.org>, Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Jiri Kosina <trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-hwmon-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 11/22/2017 10:32 PM, Joel Stanley wrote:
> On Sun, Nov 19, 2017 at 2:45 AM, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org> wrote:
>> On Mon, Nov 13, 2017 at 11:27:33AM +0800, Lei YU wrote:
>>> Nuvoton W83773G is a hardware monitor IC providing one local
>>> temperature and two remote temperature sensors.
>>>
>>> Signed-off-by: Lei YU <mine260309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>
>> Applied to hwmon-next.
> 
> Where does hwmon-next live? I was looking on kernel.org and I can't
> seem to find it.
> 
git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
branch hwmon-next, but I('ll only push it after the commit window closes.

Guenter
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
