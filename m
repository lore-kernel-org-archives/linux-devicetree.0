From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [Question] orphan platform data header
Date: Sat, 20 Jul 2019 12:25:58 +0900
Message-ID: <CAK7LNASyzmYjjBkFxRc06rqf36-en-bvJvrKcg6iiRfjoPCxhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, masahiroy@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi.

I see several platform-data headers
that are not used in upstream.


For instance, please look at this driver:
drivers/leds/leds-netxbig.c

If I understood it correctly, this driver
supports both device tree and legacy board-file.


I grepped 'netxbig_led_platform_data', but
I only found the driver and platform_data header.
No board-file in upstream.

masahiro@grover:~/ref/linux$ git grep netxbig_led_platform_data
drivers/leds/leds-netxbig.c:                          struct
netxbig_led_platform_data *pdata,
drivers/leds/leds-netxbig.c:                                 struct
netxbig_led_platform_data *pdata)
drivers/leds/leds-netxbig.c:                      struct
netxbig_led_platform_data *pdata)
drivers/leds/leds-netxbig.c:    struct netxbig_led_platform_data
*pdata = dev_get_platdata(&pdev->dev);
include/linux/platform_data/leds-kirkwood-netxbig.h:struct
netxbig_led_platform_data {



So, what shall we do?

Drop the board-file support? Or, keep it
in case somebody is still using their board-files
in downstream?




--
Best Regards
Masahiro Yamada
