From: Robert MARKLUND <robert.marklund@stericsson.com>
Subject: RE: CoreSight framework and drivers
Date: Thu, 21 Feb 2013 15:32:38 +0100
Message-ID: <2B1D156D95AE9B4EAD379CB9E465FE73272F65EE59@EXDCVYMBSTM005.EQ1STM.local>
References: <1355858365-11849-1-git-send-email-pratikp@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1355858365-11849-1-git-send-email-pratikp@codeaurora.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "pratikp@codeaurora.org" <pratikp@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "will.deacon@arm.com" <will.deacon@arm.com>, Magnus PERSSON <magnus.p.persson@stericsson.com>, "david.rusling@linaro.org" <david.rusling@linaro.org>, "arve@android.com" <arve@android.com>, "dsaxena@linaro.org" <dsaxena@linaro.org>, "john.stultz@linaro.org" <john.stultz@linaro.org>, "jon-hunter@ti.com" <jon-hunter@ti.com>, "d-deao@ti.com" <d-deao@ti.com>, Christian BEJRAM <christian.bejram@stericsson.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

Would it be easy to add dummy sources to control data coming from other ETM sources not controlled by the kernel.
Also I want the ability to have multiple sinks enabled at one time and just control the flow from the sources to direct where the data goes.
Not that clear but I hope you understand :)

BR
Robert

> -----Original Message-----
> From: linux-arm-kernel-bounces@lists.infradead.org [mailto:linux-arm-kernel-bounces@lists.infradead.org] On Behalf Of
> pratikp@codeaurora.org
> Sent: den 18 december 2012 20:19
> To: linux-arm-kernel@lists.infradead.org
> Cc: linux@arm.linux.org.uk; linus.walleij@linaro.org; will.deacon@arm.com; Magnus PERSSON; david.rusling@linaro.org;
> arve@android.com; dsaxena@linaro.org; john.stultz@linaro.org; jon-hunter@ti.com; d-deao@ti.com; Christian BEJRAM; devicetree-
> discuss@lists.ozlabs.org
> Subject: CoreSight framework and drivers
> 
> This RFC is aimed at introducing CoreSight framework as well as
> individual CoreSight trace component drivers adhering to ARM
> CoreSight specification. Some prior discussion on this can be
> referred at [1].
> 
> There are 3 kinds of CoreSight trace components:
> 
> * Sources: Responsible for producing trace data to provide
>   visibility for the associated entity.
> 
> * Links: Transport components that carry trace data.
> 
> * Sinks: Collectors for storing trace data or acting as conduits
>   for off-chip trace data collection.
> 
> These components can be connected in various topologies to suite
> a particular SoCs tracing needs.
> 
> Framework is responsible for gathering and using the information
> about the registered CoreSight components and their connections
> to allow it to dynamically deduce the sequence of components
> representing a connection from a CoreSight source to the
> currently selected CoreSight sink. This helps the framework to
> program the correct set of components to satisfy user request.
> 
> [1] http://comments.gmane.org/gmane.linux.ports.arm.kernel/204591
> 
> Pratik Patel (8):
>   coresight: add CoreSight core layer framework
>   coresight: add CoreSight TMC driver
>   coresight: add CoreSight TPIU driver
>   coresight: add CoreSight ETB driver
>   coresight: add CoreSight Funnel driver
>   coresight: add CoreSight Replicator driver
>   coresight: add CoreSight STM driver
>   coresight: add CoreSight ETM driver
> 
>  Documentation/devicetree/bindings/arm/coresight.txt |  110 ++
>  arch/arm/include/asm/hardware/cp14.h                |  540 ++++++
>  drivers/Kconfig                                     |    2 +
>  drivers/Makefile                                    |    1 +
>  drivers/coresight/Kconfig                           |   60 +
>  drivers/coresight/Makefile                          |    8 +
>  drivers/coresight/coresight-etb.c                   |  467 +++++
>  drivers/coresight/coresight-etm-cp14.c              |  510 ++++++
>  drivers/coresight/coresight-etm.c                   | 1752 +++++++++++++++++++
>  drivers/coresight/coresight-funnel.c                |  260 +++
>  drivers/coresight/coresight-priv.h                  |   48 +
>  drivers/coresight/coresight-replicator.c            |  211 +++
>  drivers/coresight/coresight-stm.c                   |  819 +++++++++
>  drivers/coresight/coresight-tmc.c                   |  794 +++++++++
>  drivers/coresight/coresight-tpiu.c                  |  232 +++
>  drivers/coresight/coresight.c                       |  681 +++++++
>  drivers/coresight/of_coresight.c                    |   99 ++
>  include/linux/coresight-stm.h                       |   51 +
>  include/linux/coresight.h                           |  167 ++
>  include/linux/of_coresight.h                        |   27 +
>  20 files changed, 6839 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/arm/coresight.txt
>  create mode 100644 arch/arm/include/asm/hardware/cp14.h
>  create mode 100644 drivers/coresight/Kconfig
>  create mode 100644 drivers/coresight/Makefile
>  create mode 100644 drivers/coresight/coresight-etb.c
>  create mode 100644 drivers/coresight/coresight-etm-cp14.c
>  create mode 100644 drivers/coresight/coresight-etm.c
>  create mode 100644 drivers/coresight/coresight-funnel.c
>  create mode 100644 drivers/coresight/coresight-priv.h
>  create mode 100644 drivers/coresight/coresight-replicator.c
>  create mode 100644 drivers/coresight/coresight-stm.c
>  create mode 100644 drivers/coresight/coresight-tmc.c
>  create mode 100644 drivers/coresight/coresight-tpiu.c
>  create mode 100644 drivers/coresight/coresight.c
>  create mode 100644 drivers/coresight/of_coresight.c
>  create mode 100644 include/linux/coresight-stm.h
>  create mode 100644 include/linux/coresight.h
>  create mode 100644 include/linux/of_coresight.h
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
