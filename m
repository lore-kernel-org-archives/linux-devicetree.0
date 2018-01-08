From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH] Revert "ARM: dts: bcm283x: Fix DTC warnings about missing
 phy-cells"
Date: Mon, 8 Jan 2018 10:36:42 +0100
Message-ID: <dd0372b5-e16c-ce77-ce39-2c4ffa61f663@i2se.com>
References: <1515332212-23593-1-git-send-email-stefan.wahren@i2se.com>
 <87incdjp9k.fsf@anholt.net> <df3db2e7-5d0f-9c1c-b005-41cf00e7d851@i2se.com>
 <CAK8P3a3qfiX_ZsD8pLmoTJZ2+Q8PkHGmfTFW=NL8P8QFML_dLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAK8P3a3qfiX_ZsD8pLmoTJZ2+Q8PkHGmfTFW=NL8P8QFML_dLw@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: DTML <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>, arm-soc <arm@kernel.org>, Olof Johansson <olof@lixom.net>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Arnd,


Am 08.01.2018 um 10:27 schrieb Arnd Bergmann:
> On Mon, Jan 8, 2018 at 10:15 AM, Stefan Wahren <stefan.wahren@i2se.com> wrote:
>> Hi Eric,
>> Am 07.01.2018 um 23:08 schrieb Eric Anholt:
>>> Stefan Wahren <stefan.wahren@i2se.com> writes:
>>>
>>>> This reverts commit 014d6da6cb2525d7f48fb08c705cb130cc7b5f4a.
>>>>
>>>> The DT clean up could trigger an endless deferred probe of DWC2 USB
>>>> driver
>>>> on the Raspberry Pi 2/3. So revert the change until we fixed the probing
>>>> issue.
>>> Why's that?  I found that I needed to enable the generic no-op phy
>>> driver, but other than that it was fine.
>>
>> in order to avoid this regression. Changing the configuration is not a
>> solution for the kernelci guys.
>>
>> Btw
>>
>> CONFIG_NOP_USB_XCEIV=y
>>
>> is already enabled in arm64/defconfig and the issue still occured. Do you
>> mean a different option?
> Obviously we need to fix this, but I really want to understand what exactly
> happened so we can fix the code if possible rather than making the
> dts file incompatible with the binding again.

i fully agree, but dwc2 "hacking" usually requires more time than 
reverting this change.

>
> Do you have any more insight into how we get into the deferred probe
> situation?

I send this bug report [1] on Friday to linux-usb.

Stefan

[1] - https://marc.info/?l=linux-usb&m=151518314314753&w=2

>
>         Arnd
