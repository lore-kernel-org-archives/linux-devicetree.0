From: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Subject: Re: [PATCH] fsi: Add Self Boot Engine FIFO FSI client
Date: Mon, 04 Dec 2017 10:35:14 +1030
Message-ID: <1512345914.2253418.1192700936.67D4C814@webmail.messagingengine.com>
References: <20171201130744.17659-1-andrew@aj.id.au>
 <201712040455.1tZmVDmK%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201712040455.1tZmVDmK%fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, bradleyb-r5pk2Da7Bxt8sGd51Jp2sdBPR1lH4CV8@public.gmane.org, cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

If there's enthusiasm for what I've proposed over Eddy and Brad's patch,
I'll clean up the kbuild issues and resend. It was more meant to trigger
discussion than sent as ready for submission.

Cheers,

Andrew

On Mon, 4 Dec 2017, at 06:55, kbuild test robot wrote:
> Hi Andrew,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v4.15-rc2 next-20171201]
> [if your patch is applied to the wrong git tree, please drop us a note to
> help improve the system]
> 
> url:   
> https://github.com/0day-ci/linux/commits/Andrew-Jeffery/fsi-Add-Self-Boot-Engine-FIFO-FSI-client/20171204-031454
> config: blackfin-allmodconfig (attached as .config)
> compiler: bfin-uclinux-gcc (GCC) 6.2.0
> reproduce:
>         wget
>         https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross
>         -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         make.cross ARCH=blackfin 
> 
> All error/warnings (new ones prefixed by >>):
> 
> >> drivers/fsi//clients/fsi-sbefifo.c:325:0: warning: "TEST_SET" redefined
>     #define TEST_SET(s) ((s) & BIT(7))
>     
>    In file included from
>    arch/blackfin/mach-bf533/include/mach/blackfin.h:15:0,
>                     from arch/blackfin/include/asm/irqflags.h:11,
>                     from include/linux/irqflags.h:16,
>                     from arch/blackfin/include/asm/bitops.h:33,
>                     from include/linux/bitops.h:38,
>                     from drivers/fsi//clients/fsi-sbefifo.c:5:
>    arch/blackfin/include/asm/def_LPBlackfin.h:687:0: note: this is the
>    location of the previous definition
>     #define TEST_SET(x)    ((x << 5) & 0x03E0) /* Set Index 0->31 */
>     
>    In file included from include/linux/printk.h:329:0,
>                     from include/linux/kernel.h:14,
>                     from include/linux/list.h:9,
>                     from include/linux/kobject.h:20,
>                     from include/linux/device.h:17,
>                     from include/linux/fsi.h:18,
>                     from drivers/fsi//clients/fsi-sbefifo.c:6:
>    drivers/fsi//clients/fsi-sbefifo.c: In function 'sbefifo_drain':
> >> drivers/fsi//clients/fsi-sbefifo.c:359:21: warning: format '%d' expects argument of type 'int', but argument 7 has type 'ssize_t {aka long int}' [-Wformat=]
>      dev_dbg(fifo->dev, "%s: valid_set: 0x%x, eot_set: 0x%x, nr_valid:
>      %d, nr_xfer: %d, rem: %d\n",
>                         ^
>    include/linux/dynamic_debug.h:135:39: note: in definition of macro
>    'dynamic_dev_dbg'
>       __dynamic_dev_dbg(&descriptor, dev, fmt, \
>                                           ^~~
> >> drivers/fsi//clients/fsi-sbefifo.c:359:2: note: in expansion of macro 'dev_dbg'
>      dev_dbg(fifo->dev, "%s: valid_set: 0x%x, eot_set: 0x%x, nr_valid:
>      %d, nr_xfer: %d, rem: %d\n",
>      ^~~~~~~
>    drivers/fsi//clients/fsi-sbefifo.c:359:21: warning: format '%d'
>    expects argument of type 'int', but argument 9 has type 'ssize_t {aka
>    long int}' [-Wformat=]
>      dev_dbg(fifo->dev, "%s: valid_set: 0x%x, eot_set: 0x%x, nr_valid:
>      %d, nr_xfer: %d, rem: %d\n",
>                         ^
>    include/linux/dynamic_debug.h:135:39: note: in definition of macro
>    'dynamic_dev_dbg'
>       __dynamic_dev_dbg(&descriptor, dev, fmt, \
>                                           ^~~
> >> drivers/fsi//clients/fsi-sbefifo.c:359:2: note: in expansion of macro 'dev_dbg'
>      dev_dbg(fifo->dev, "%s: valid_set: 0x%x, eot_set: 0x%x, nr_valid:
>      %d, nr_xfer: %d, rem: %d\n",
>      ^~~~~~~
>    drivers/fsi//clients/fsi-sbefifo.c:378:21: warning: format '%d'
>    expects argument of type 'int', but argument 7 has type 'ssize_t {aka
>    long int}' [-Wformat=]
>      dev_dbg(fifo->dev, "%s: Data phase complete: valid_set: 0x%x,
>      eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
>                         ^
>    include/linux/dynamic_debug.h:135:39: note: in definition of macro
>    'dynamic_dev_dbg'
>       __dynamic_dev_dbg(&descriptor, dev, fmt, \
>                                           ^~~
>    drivers/fsi//clients/fsi-sbefifo.c:378:2: note: in expansion of macro
>    'dev_dbg'
>      dev_dbg(fifo->dev, "%s: Data phase complete: valid_set: 0x%x,
>      eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
>      ^~~~~~~
>    drivers/fsi//clients/fsi-sbefifo.c:378:21: warning: format '%d'
>    expects argument of type 'int', but argument 9 has type 'ssize_t {aka
>    long int}' [-Wformat=]
>      dev_dbg(fifo->dev, "%s: Data phase complete: valid_set: 0x%x,
>      eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
>                         ^
>    include/linux/dynamic_debug.h:135:39: note: in definition of macro
>    'dynamic_dev_dbg'
>       __dynamic_dev_dbg(&descriptor, dev, fmt, \
>                                           ^~~
>    drivers/fsi//clients/fsi-sbefifo.c:378:2: note: in expansion of macro
>    'dev_dbg'
>      dev_dbg(fifo->dev, "%s: Data phase complete: valid_set: 0x%x,
>      eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
>      ^~~~~~~
>    drivers/fsi//clients/fsi-sbefifo.c:403:21: warning: format '%d'
>    expects argument of type 'int', but argument 7 has type 'ssize_t {aka
>    long int}' [-Wformat=]
>      dev_dbg(fifo->dev, "%s: EOT phase complete: valid_set: 0x%x,
>      eot_set: 0x%x, nr_valid: %d\n, nr_xfer: %d, rem: %d\n",
>                         ^
>    include/linux/dynamic_debug.h:135:39: note: in definition of macro
>    'dynamic_dev_dbg'
>       __dynamic_dev_dbg(&descriptor, dev, fmt, \
>                                           ^~~
>    drivers/fsi//clients/fsi-sbefifo.c:403:2: note: in expansion of macro
>    'dev_dbg'
>      dev_dbg(fifo->dev, "%s: EOT phase complete: valid_set: 0x%x,
>      eot_set: 0x%x, nr_valid: %d\n, nr_xfer: %d, rem: %d\n",
>      ^~~~~~~
>    drivers/fsi//clients/fsi-sbefifo.c:403:21: warning: format '%d'
>    expects argument of type 'int', but argument 9 has type 'ssize_t {aka
>    long int}' [-Wformat=]
>      dev_dbg(fifo->dev, "%s: EOT phase complete: valid_set: 0x%x,
>      eot_set: 0x%x, nr_valid: %d\n, nr_xfer: %d, rem: %d\n",
>                         ^
>    include/linux/dynamic_debug.h:135:39: note: in definition of macro
>    'dynamic_dev_dbg'
>       __dynamic_dev_dbg(&descriptor, dev, fmt, \
>                                           ^~~
>    drivers/fsi//clients/fsi-sbefifo.c:403:2: note: in expansion of macro
>    'dev_dbg'
>      dev_dbg(fifo->dev, "%s: EOT phase complete: valid_set: 0x%x,
>      eot_set: 0x%x, nr_valid: %d\n, nr_xfer: %d, rem: %d\n",
>      ^~~~~~~
>    drivers/fsi//clients/fsi-sbefifo.c:417:21: warning: format '%d'
>    expects argument of type 'int', but argument 7 has type 'ssize_t {aka
>    long int}' [-Wformat=]
>      dev_dbg(fifo->dev, "%s: Drain phase complete: valid_set: 0x%x,
>      eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
>                         ^
>    include/linux/dynamic_debug.h:135:39: note: in definition of macro
>    'dynamic_dev_dbg'
>       __dynamic_dev_dbg(&descriptor, dev, fmt, \
>                                           ^~~
>    drivers/fsi//clients/fsi-sbefifo.c:417:2: note: in expansion of macro
>    'dev_dbg'
>      dev_dbg(fifo->dev, "%s: Drain phase complete: valid_set: 0x%x,
>      eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
>      ^~~~~~~
>    drivers/fsi//clients/fsi-sbefifo.c:417:21: warning: format '%d'
>    expects argument of type 'int', but argument 9 has type 'ssize_t {aka
>    long int}' [-Wformat=]
>      dev_dbg(fifo->dev, "%s: Drain phase complete: valid_set: 0x%x,
>      eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
>                         ^
>    include/linux/dynamic_debug.h:135:39: note: in definition of macro
>    'dynamic_dev_dbg'
>       __dynamic_dev_dbg(&descriptor, dev, fmt, \
>                                           ^~~
>    drivers/fsi//clients/fsi-sbefifo.c:417:2: note: in expansion of macro
>    'dev_dbg'
>      dev_dbg(fifo->dev, "%s: Drain phase complete: valid_set: 0x%x,
>      eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
>      ^~~~~~~
>    In file included from include/linux/list.h:9:0,
>                     from include/linux/kobject.h:20,
>                     from include/linux/device.h:17,
>                     from include/linux/fsi.h:18,
>                     from drivers/fsi//clients/fsi-sbefifo.c:6:
>    drivers/fsi//clients/fsi-sbefifo.c: In function 'sbefifo_down_read':
>    include/linux/kernel.h:792:16: warning: comparison of distinct pointer
>    types lacks a cast
>      (void) (&min1 == &min2);   \
>                    ^
>    include/linux/kernel.h:801:2: note: in expansion of macro '__min'
>      __min(typeof(x), typeof(y),   \
>      ^~~~~
> >> drivers/fsi//clients/fsi-sbefifo.c:453:34: note: in expansion of macro 'min'
>      } while (rem && read && read == min((rem + read),
>      SBEFIFO_FIFO_DEPTH));
>                                      ^~~
>    drivers/fsi//clients/fsi-sbefifo.c: In function 'sbefifo_write':
>    drivers/fsi//clients/fsi-sbefifo.c:557:43: warning: format '%d'
>    expects argument of type 'int', but argument 3 has type 'ssize_t {aka
>    long int}' [-Wformat=]
>       dev_err(fifo->dev, "FIFO write failed: %d\n", rv);
>                                               ^
>    In file included from arch/blackfin/include/asm/bug.h:71:0,
>                     from include/linux/bug.h:5,
>                     from include/linux/thread_info.h:12,
>                     from include/asm-generic/current.h:5,
>                     from
>                     ./arch/blackfin/include/generated/asm/current.h:1,
>                     from include/linux/mutex.h:14,
>                     from include/linux/kernfs.h:13,
>                     from include/linux/sysfs.h:16,
>                     from include/linux/kobject.h:21,
>                     from include/linux/device.h:17,
>                     from include/linux/fsi.h:18,
>                     from drivers/fsi//clients/fsi-sbefifo.c:6:
>    drivers/fsi//clients/fsi-sbefifo.c:572:17: warning: format '%d'
>    expects argument of type 'int', but argument 4 has type 'ssize_t {aka
>    long int}' [-Wformat=]
>      WARN(rv > len, "Unreachable state: len: %d, rv: %d\n", len, rv);
>                     ^
>    include/asm-generic/bug.h:91:69: note: in definition of macro
>    '__WARN_printf'
>     #define __WARN_printf(arg...) warn_slowpath_fmt(__FILE__, __LINE__,
>     arg)
>                                                                         ^~~
> >> drivers/fsi//clients/fsi-sbefifo.c:572:2: note: in expansion of macro 'WARN'
>      WARN(rv > len, "Unreachable state: len: %d, rv: %d\n", len, rv);
>      ^~~~
>    drivers/fsi//clients/fsi-sbefifo.c:572:17: warning: format '%d'
>    expects argument of type 'int', but argument 5 has type 'ssize_t {aka
>    long int}' [-Wformat=]
>      WARN(rv > len, "Unreachable state: len: %d, rv: %d\n", len, rv);
>                     ^
>    include/asm-generic/bug.h:91:69: note: in definition of macro
>    '__WARN_printf'
>     #define __WARN_printf(arg...) warn_slowpath_fmt(__FILE__, __LINE__,
>     arg)
>                                                                         ^~~
> >> drivers/fsi//clients/fsi-sbefifo.c:572:2: note: in expansion of macro 'WARN'
>      WARN(rv > len, "Unreachable state: len: %d, rv: %d\n", len, rv);
>      ^~~~
>    drivers/fsi//clients/fsi-sbefifo.c: In function 'sbefifo_read':
>    drivers/fsi//clients/fsi-sbefifo.c:650:42: warning: format '%d'
>    expects argument of type 'int', but argument 3 has type 'ssize_t {aka
>    long int}' [-Wformat=]
>       dev_err(fifo->dev, "FIFO read failed: %d\n", rv);
>                                              ^
>    drivers/fsi//clients/fsi-sbefifo.c: In function 'sbefifo_probe':
> >> drivers/fsi//clients/fsi-sbefifo.c:769:2: error: implicit declaration of function 'setup_timer' [-Werror=implicit-function-declaration]
>      setup_timer(&fifo->poll.timer, sbefifo_poll_device,
>      ^~~~~~~~~~~
>    cc1: some warnings being treated as errors
> 
> vim +/setup_timer +769 drivers/fsi//clients/fsi-sbefifo.c
> 
>    498     
>    499     /**
>    500      * sbefifo_write()
>    501      *
>    502      * @client      The client context for the SBEFIFO
>    503      * @buf         The buffer of data to write, at least @len
>    elements
>    504      * @len         The number elements in @buffer
>    505      *
>    506      * The buffer must represent a complete chip-op: EOT is
>    signalled after the
>    507      * last element is written to the upstream FIFO.
>    508      *
>    509      * Returns the number of elements written on success and
>    negative values on
>    510      * failure. If the call is successful a subsequent call to
>    sbefifo_read() MUST
>    511      * be made.
>    512      */
>    513     ssize_t sbefifo_write(struct sbefifo_client *client, const u32
>    *buf,
>    514                           ssize_t len)
>    515     {
>    516             struct sbefifo *fifo = client->fifo;
>    517             unsigned long flags;
>    518             ssize_t rv;
>    519     
>    520             spin_lock_irqsave(&fifo->wait.lock, flags);
>    521     
>    522             if (client->state == sbefifo_client_active) {
>    523                     dev_warn(fifo->dev, "Transfer already in
>    progress\n");
>    524                     spin_unlock_irqrestore(&fifo->wait.lock,
>    flags);
>    525                     return -EBUSY;
>    526             }
>    527     
>    528             rv = wait_event_interruptible_locked_irq(fifo->wait,
>    529                                                     fifo->state ==
>    sbefifo_ready ||
>    530                                                     fifo->state ==
>    sbefifo_dead);
>    531             if (rv < 0) {
>    532                     spin_unlock_irqrestore(&fifo->wait.lock,
>    flags);
>    533                     return rv;
>    534             }
>    535     
>    536             if (fifo->state == sbefifo_dead) {
>    537                     client->state = sbefifo_client_closed;
>    538                     wake_up(&client->wait);
>    539                     spin_unlock_irqrestore(&fifo->wait.lock,
>    flags);
>    540                     return -ENODEV;
>    541             }
>    542     
>    543             WARN_ON(fifo->state != sbefifo_ready);
>    544     
>    545             fifo->curr = client;
>    546             fifo->state = sbefifo_tx;
>    547     
>    548             /* Move a threaded read() onto waiting for FIFO read
>    readiness */
>    549             client->state = sbefifo_client_active;
>    550             wake_up(&client->wait);
>    551     
>    552             spin_unlock_irqrestore(&fifo->wait.lock, flags);
>    553     
>    554             /* FIFO Tx, reset the FIFO on error */
>    555             rv = sbefifo_up_write(fifo, buf, len);
>    556             if (rv < len) {
>    557                     dev_err(fifo->dev, "FIFO write failed: %d\n",
>    rv);
>    558                     rv = sbefifo_reset(fifo);
>    559                     if (rv < 0)
>    560                             return rv;
>    561     
>    562                     spin_lock_irqsave(&fifo->wait.lock, flags);
>    563                     fifo->state = sbefifo_ready;
>    564                     client->state = sbefifo_client_idle;
>    565                     wake_up(&client->wait);
>    566                     wake_up_locked(&fifo->wait);
>    567                     spin_unlock_irqrestore(&fifo->wait.lock,
>    flags);
>    568     
>    569                     return -EIO;
>    570             }
>    571     
>  > 572		WARN(rv > len, "Unreachable state: len: %d, rv: %d\n", len, rv);
>    573     
>    574             /* Write completed successfully */
>    575             spin_lock_irqsave(&fifo->wait.lock, flags);
>    576             fifo->state = sbefifo_interval;
>    577             wake_up(&client->wait);
>    578             spin_unlock_irqrestore(&fifo->wait.lock, flags);
>    579     
>    580             return rv;
>    581     }
>    582     EXPORT_SYMBOL_GPL(sbefifo_write);
>    583     
>    584     /**
>    585      * sbefifo_read()
>    586      *
>    587      * @client      The client context for the SBEFIFO
>    588      * @data        The buffer of data to write, at least @len
>    elements
>    589      * @len         The number elements in @buffer
>    590      *
>    591      * Returns the number of elements read on success and negative
>    values on
>    592      * failure. A return value of 0 indicates EOT.
>    593      */
>    594     ssize_t sbefifo_read(struct sbefifo_client *client, u32 *buf,
>    ssize_t len)
>    595     {
>    596             struct sbefifo *fifo = client->fifo;
>    597             unsigned long flags;
>    598             ssize_t rv;
>    599     
>    600             rv = wait_event_interruptible(client->wait,
>    601                                           (client->state ==
>    sbefifo_client_active ||
>    602                                            client->state ==
>    sbefifo_client_closed));
>    603             if (rv < 0)
>    604                     return rv;
>    605     
>    606             spin_lock_irqsave(&fifo->wait.lock, flags);
>    607             if (client->state == sbefifo_client_closed) {
>    608                     spin_unlock_irqrestore(&fifo->wait.lock,
>    flags);
>    609                     return -EBADFD;
>    610             }
>    611     
>    612             if (client->state == sbefifo_client_idle) {
>    613                     spin_unlock_irqrestore(&fifo->wait.lock,
>    flags);
>    614                     return -EIO;
>    615             }
>    616     
>    617             rv = wait_event_interruptible_locked_irq(fifo->wait,
>    618                                             fifo->state ==
>    sbefifo_interval ||
>    619                                             fifo->state ==
>    sbefifo_rx ||
>    620                                             fifo->state ==
>    sbefifo_ready ||
>    621                                             fifo->state ==
>    sbefifo_dead);
>    622             if (rv < 0) {
>    623                     spin_unlock_irqrestore(&fifo->wait.lock,
>    flags);
>    624                     return rv;
>    625             }
>    626     
>    627             if (fifo->state == sbefifo_ready) {
>    628                     /* We've reset FIFO, whatever we were waiting
>    for has gone */
>    629                     client->state = sbefifo_client_idle;
>    630                     /* We're done, wake another task up as the
>    FIFO is ready */
>    631                     wake_up_locked(&fifo->wait);
>    632                     spin_unlock_irqrestore(&fifo->wait.lock,
>    flags);
>    633                     return -EIO;
>    634             }
>    635     
>    636             if (fifo->state == sbefifo_dead) {
>    637                     spin_unlock_irqrestore(&fifo->wait.lock,
>    flags);
>    638                     return -ENODEV;
>    639             }
>    640     
>    641             fifo->state = sbefifo_rx;
>    642             spin_unlock_irqrestore(&fifo->wait.lock, flags);
>    643     
>    644             rv = sbefifo_down_read(fifo, buf, len);
>    645             if (rv > 0)
>    646                     return rv;
>    647     
>    648             /* Reset the FIFO on error */
>    649             if (rv < 0) {
>    650                     dev_err(fifo->dev, "FIFO read failed: %d\n",
>    rv);
>    651                     rv = sbefifo_reset(fifo);
>    652                     if (rv < 0)
>    653                             return rv;
>    654     
>    655                     rv = -EIO;
>    656             }
>    657     
>    658             /* Read is complete one way or the other (0 length
>    read or error) */
>    659             spin_lock_irqsave(&fifo->wait.lock, flags);
>    660             client->state = sbefifo_client_idle;
>    661     
>    662             /* Queue next FIFO transfer */
>    663             fifo->curr = NULL;
>    664             fifo->state = sbefifo_ready;
>    665             wake_up_locked(&fifo->wait);
>    666     
>    667             spin_unlock_irqrestore(&fifo->wait.lock, flags);
>    668     
>    669             return rv;
>    670     }
>    671     EXPORT_SYMBOL_GPL(sbefifo_read);
>    672     
>    673     /**
>    674      * sbefifo_release()
>    675      *
>    676      * @client      The client context for the SBEFIFO
>    677      *
>    678      */
>    679     int sbefifo_release(struct sbefifo_client *client)
>    680     {
>    681             struct sbefifo *fifo = client->fifo;
>    682             enum sbefifo_client_state old;
>    683             unsigned long flags;
>    684             int rv;
>    685     
>    686             /* Determine if we need to clean up */
>    687             spin_lock_irqsave(&client->fifo->wait.lock, flags);
>    688             old = client->state;
>    689             client->state = sbefifo_client_closed;
>    690     
>    691             if (old == sbefifo_client_closed) {
>    692                     spin_unlock_irqrestore(&fifo->wait.lock,
>    flags);
>    693                     return -EBADFD;
>    694             }
>    695     
>    696             if (old == sbefifo_client_idle) {
>    697                     spin_unlock_irqrestore(&fifo->wait.lock,
>    flags);
>    698                     return 0;
>    699             }
>    700     
>    701             /* We need to clean up, get noisy about
>    inconsistencies */
>    702             dev_warn(fifo->dev, "Releasing client with transfer in
>    progress!\n");
>    703             WARN_ON(old != sbefifo_client_active);
>    704             WARN_ON(fifo->state == sbefifo_ready);
>    705     
>    706             /* Mark ourselves as broken for cleanup */
>    707             fifo->state = sbefifo_broken;
>    708             fifo->curr = NULL;
>    709     
>    710             wake_up(&client->wait);
>    711             spin_unlock_irqrestore(&client->fifo->wait.lock,
>    flags);
>    712     
>    713             /* Clean up poll waiter */
>    714             spin_lock_irqsave(&fifo->poll.wait.lock, flags);
>    715             del_timer_sync(&fifo->poll.timer);
>    716             fifo->poll.rv = -EBADFD;
>    717             wake_up_all_locked(&fifo->poll.wait);
>    718             spin_unlock_irqrestore(&fifo->poll.wait.lock, flags);
>    719     
>    720             /* Reset the FIFO */
>    721             rv = sbefifo_reset(fifo);
>    722             if (rv < 0)
>    723                     return rv;
>    724     
>    725             /* Mark the FIFO as ready and wake pending transfer */
>    726             spin_lock_irqsave(&client->fifo->wait.lock, flags);
>    727             fifo->state = sbefifo_ready;
>    728             wake_up_locked(&fifo->wait);
>    729             spin_unlock_irqrestore(&client->fifo->wait.lock,
>    flags);
>    730     
>    731             return 0;
>    732     }
>    733     EXPORT_SYMBOL_GPL(sbefifo_release);
>    734     
>    735     static int sbefifo_unregister_child(struct device *dev, void
>    *data)
>    736     {
>    737             struct platform_device *pdev =
>    to_platform_device(dev);
>    738     
>    739             of_device_unregister(pdev);
>    740             if (dev->of_node)
>    741                     of_node_clear_flag(dev->of_node,
>    OF_POPULATED);
>    742     
>    743             return 0;
>    744     }
>    745     
>    746     static int sbefifo_probe(struct device *dev)
>    747     {
>    748             struct device_node *np;
>    749             struct sbefifo *fifo;
>    750             int child_idx;
>    751             u32 up, down;
>    752             int rv;
>    753     
>    754             fifo = devm_kzalloc(dev, sizeof(*fifo), GFP_KERNEL);
>    755             if (!fifo)
>    756                     return -ENOMEM;
>    757     
>    758             fifo->dev = dev;
>    759             fifo->state = sbefifo_ready;
>    760             fifo->fsi = to_fsi_dev(dev);
>    761     
>    762             fifo->id = ida_simple_get(&sbefifo_ida, 0, 0,
>    GFP_KERNEL);
>    763             if (fifo->id < 0)
>    764                     return fifo->id;
>    765     
>    766             init_waitqueue_head(&fifo->wait);
>    767     
>    768             /* No interrupts, need to poll the controller */
>  > 769		setup_timer(&fifo->poll.timer, sbefifo_poll_device,
>    770                         (unsigned long)fifo);
>    771             init_waitqueue_head(&fifo->poll.wait);
>    772     
>    773             rv = sbefifo_up_sts(fifo, &up);
>    774             if (rv < 0)
>    775                     return rv;
>    776     
>    777             rv = sbefifo_down_sts(fifo, &down);
>    778             if (rv < 0)
>    779                     return rv;
>    780     
>    781             if (!(sbefifo_empty(up) && sbefifo_empty(down)))  {
>    782                     dev_warn(fifo->dev, "FIFOs were not empty,
>    requesting reset from SBE\n");
>    783                     /* Request the SBE reset the FIFOs */
>    784                     rv = sbefifo_reset(fifo);
>    785                     if (rv == -ETIMEDOUT) {
>    786                             dev_warn(fifo->dev, "SBE unresponsive,
>    probing FIFO clients may fail. Performing hard FIFO reset\n");
>    787                             rv = sbefifo_do_reset(fifo);
>    788                             if (rv < 0)
>    789                                     return rv;
>    790                     } else if (rv < 0) {
>    791                             return rv;
>    792                     }
>    793             }
>    794     
>    795             dev_set_drvdata(dev, fifo);
>    796             list_add(&fifo->entry, &sbefifos);
>    797     
>    798             child_idx = 0;
>    799             for_each_available_child_of_node(dev->of_node, np) {
>    800                     struct platform_device *child;
>    801                     char name[32];
>    802     
>    803                     snprintf(name, sizeof(name),
>    "sbefifo%d-dev%d", fifo->id,
>    804                              child_idx++);
>    805                     child = of_platform_device_create(np, name,
>    dev);
>    806                     if (!child)
>    807                             dev_warn(dev, "Failed to create
>    platform device %s\n",
>    808                                      name);
>    809             }
>    810     
>    811             return 0;
>    812     }
>    813     
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology
> Center
> https://lists.01.org/pipermail/kbuild-all                   Intel
> Corporation
> Email had 1 attachment:
> + .config.gz
>   64k (application/gzip)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
