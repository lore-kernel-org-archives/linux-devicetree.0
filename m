From: "Christian Daudt" <csd@broadcom.com>
Subject: Re: [PATCH 0/2] ARM: bcm281xx: Board specific reboot code
Date: Fri, 19 Jul 2013 16:33:37 -0700
Message-ID: <51E9CCD1.60903@broadcom.com>
References: <1372453018-5830-1-git-send-email-markus.mayer@linaro.org>
 <CAPdLdq=0k56kX01easzTb11AUo=Ew+DCrmMpq8=2ruEJEuMF3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAPdLdq=0k56kX01easzTb11AUo=Ew+DCrmMpq8=2ruEJEuMF3Q@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Markus Mayer <markus.mayer@linaro.org>
Cc: Device Tree List <devicetree-discuss@lists.ozlabs.org>, ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On 13-06-28 02:00 PM, Markus Mayer wrote:
> Adding Christian who got dropped from the Cc list.
>
> -Markus
>
> On 28 June 2013 13:56, Markus Mayer <markus.mayer@linaro.org> wrote:
>> This patch series adds reboot code and related device tree bindings needed
>> for the bcm281xx family.
>>
>> Markus Mayer (2):
>>    ARM: bcm281xx: Board specific reboot code
>>    ARM: bcm281xx: DT changes for reboot code
>>
>>   .../devicetree/bindings/arm/bcm/bcm,kona-wdt.txt   |   15 ++++++
>>   arch/arm/boot/dts/bcm11351.dtsi                    |    7 ++-
>>   arch/arm/mach-bcm/Makefile                         |    4 +-
>>   arch/arm/mach-bcm/board_bcm.c                      |   20 ++++++--
>>   arch/arm/mach-bcm/kona.c                           |   54 ++++++++++++++++++++
>>   arch/arm/mach-bcm/kona.h                           |   15 ++++++
>>   6 files changed, 109 insertions(+), 6 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/arm/bcm/bcm,kona-wdt.txt
>>   create mode 100644 arch/arm/mach-bcm/kona.c
>>   create mode 100644 arch/arm/mach-bcm/kona.h
>>
>> --
>> 1.7.9.5
>>
>>
Pulled into bcm tree branch for-3.12/dt

  thanks,
    csd
