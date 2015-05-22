From: Timur Tabi <timur@codeaurora.org>
Subject: Re: [Linaro-acpi] [PATCH v2 6/7] Watchdog: introduce ARM SBSA watchdog
 driver
Date: Fri, 22 May 2015 11:19:52 -0500
Message-ID: <555F5728.5060209@codeaurora.org>
References: <=fu.wei@linaro.org> <20150522150145.GA2930@roeck-us.net> <555F48BD.4010605@linaro.org> <10437443.BChumWu5Uk@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <10437443.BChumWu5Uk@wuerfel>
Sender: linux-doc-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, linaro-acpi@lists.linaro.org
Cc: Hanjun Guo <hanjun.guo@linaro.org>, Guenter Roeck <linux@roeck-us.net>, corbet@lwn.net, devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, jcm@redhat.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, wim@iguana.be, tekkamanninja@gmail.com, vgandhi@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 05/22/2015 10:24 AM, Arnd Bergmann wrote:
> That will break the ACPI case, but ACPI could use platform_data to
> pass the clock rate into the driver, to make it independent of
> low-level APIs.

The clock rate isn't the only problem.  You still need to current clock 
timestamp, and that's ARM-specific.

-- 
Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
