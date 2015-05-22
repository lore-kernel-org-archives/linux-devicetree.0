From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [Linaro-acpi] [PATCH v2 6/7] Watchdog: introduce ARM SBSA watchdog
 driver
Date: Fri, 22 May 2015 15:17:48 -0500
Message-ID: <555F8EEC.7050007@codeaurora.org>
References: <=fu.wei@linaro.org> <10437443.BChumWu5Uk@wuerfel> <555F5728.5060209@codeaurora.org> <3381585.xxhO00lRy6@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3381585.xxhO00lRy6@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linaro-acpi@lists.linaro.org
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, corbet@lwn.net, jcm@redhat.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wim@iguana.be, tekkamanninja@gmail.com, vgandhi@codeaurora.org, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

On 05/22/2015 03:13 PM, Arnd Bergmann wrote:
>
> That might still be helpful to get coverage from things like the public
> coverity builds that always build x86 allmodconfig, but it's also a bit
> ugly.

Adding #ifdefs to allow COMPILE_TEST to work seems ironic to me.

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
