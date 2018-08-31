From: Trilok Soni <tsoni@codeaurora.org>
Subject: Re: [PATCH v1 0/2] Add Embedded USB Debugger (EUD) driver
Date: Fri, 31 Aug 2018 09:03:42 -0700
Message-ID: <51874c59-46d0-363d-bb53-af9450207194@codeaurora.org>
References: <1534464348-8227-1-git-send-email-pheragu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1534464348-8227-1-git-send-email-pheragu@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Prakruthi Deepak Heragu <pheragu@codeaurora.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, ckadabi@codeaurora.org, bryanh@codeaurora.org, psodagud@codeaurora.org, rnayak@codeaurora.org
List-Id: devicetree@vger.kernel.org

On 8/16/2018 5:05 PM, Prakruthi Deepak Heragu wrote:
> This is a series of patches that implements a driver for the control
> peripheral, EUD (Embedded USB Debugger). The EUD is a mini-USB hub
> implemented on chip to support the USB-based debug and trace capabilities.
> Apart from debug capabilities, EUD has a control peripheral. Control
> Peripheral is on when EUD is on and gets signals like USB attach, pet EUD,
> charge phone etc. EUD driver listens to events like USB attach or detach
> and charger enable or disable and then notifies the USB driver or PMIC
> driver respectively about these events via EXTCON. At regular intervals,
> the EUD driver receives an interrupt to pet the driver indicating that
> the software is functional.

Any other review comments on this patch series?

---Trilok Soni
