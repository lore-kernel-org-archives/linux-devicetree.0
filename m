From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 0/6] mailbox: arm_mhu: add support for doorbell mode
Date: Thu, 25 May 2017 15:15:44 +0100
Message-ID: <c4ba401f-6984-aad5-1bf9-5f2ab4497303@arm.com>
References: <1495621003-4291-1-git-send-email-sudeep.holla@arm.com>
 <CABb+yY1eS_cXjCCpgQs18-W3KXPy-K7mPJSkWNb6wFe-is5fDw@mail.gmail.com>
 <cd57b90c-4250-64df-9142-d12ac7ed7ad3@arm.com>
 <CABb+yY0jKPUW3i69jO+ZhmNum7-MS8xabns+R7hmjCOz+imgJA@mail.gmail.com>
 <ae22d77a-845c-2189-8512-5ca13ba60af1@arm.com>
 <CABb+yY1r+bQCHUxzsH3DLx1kTkz8g=jOT1_S9PnqjfBrLhe9TA@mail.gmail.com>
 <7291e5d7-fb63-57cf-c029-7a9f3b757c35@arm.com>
 <CABb+yY1feEpKTWA7hNzx+PjhVmX78zx8OM-uo_Z7r2TzFBSW4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABb+yY1feEpKTWA7hNzx+PjhVmX78zx8OM-uo_Z7r2TzFBSW4A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jassi Brar <jassisinghbrar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexey Klimov <alexey.klimov-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org



On 25/05/17 15:07, Jassi Brar wrote:
> On Thu, May 25, 2017 at 7:23 PM, Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org> wrote:
> 
>> Just propose the binding yourself.
>>
> My proposed binding is what already exists. Zero change.
> I offer to adapt your driver for you, if you are too busy to do it yourself.
> 

Care to explain how with the example I gave ?

BIT(0) - SCPI
BIT(1) - SCMI (general)
BIT(2) - SCMI (notification)
BIT(3) - A totally new protocol
:
:

The protocols drivers *has* to be independent as they are used with
other mailbox controllers. I can do the changes, but I would like to
know how.

-- 
Regards,
Sudeep
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
