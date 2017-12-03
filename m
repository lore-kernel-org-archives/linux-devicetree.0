From: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fsi: Add Self Boot Engine FIFO FSI client
Date: Mon, 4 Dec 2017 04:25:53 +0800
Message-ID: <201712040455.1tZmVDmK%fengguang.wu@intel.com>
References: <20171201130744.17659-1-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="sdtB3X0nJg68CQEu"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171201130744.17659-1-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, bradleyb-r5pk2Da7Bxt8sGd51Jp2sdBPR1lH4CV8@public.gmane.org, cbostic-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, eajames-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, "Edward A. James" <eajames-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrew,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v4.15-rc2 next-20171201]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Andrew-Jeffery/fsi-Add-Self-Boot-Engine-FIFO-FSI-client/20171204-031454
config: blackfin-allmodconfig (attached as .config)
compiler: bfin-uclinux-gcc (GCC) 6.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        make.cross ARCH=blackfin 

All error/warnings (new ones prefixed by >>):

>> drivers/fsi//clients/fsi-sbefifo.c:325:0: warning: "TEST_SET" redefined
    #define TEST_SET(s) ((s) & BIT(7))
    
   In file included from arch/blackfin/mach-bf533/include/mach/blackfin.h:15:0,
                    from arch/blackfin/include/asm/irqflags.h:11,
                    from include/linux/irqflags.h:16,
                    from arch/blackfin/include/asm/bitops.h:33,
                    from include/linux/bitops.h:38,
                    from drivers/fsi//clients/fsi-sbefifo.c:5:
   arch/blackfin/include/asm/def_LPBlackfin.h:687:0: note: this is the location of the previous definition
    #define TEST_SET(x)    ((x << 5) & 0x03E0) /* Set Index 0->31 */
    
   In file included from include/linux/printk.h:329:0,
                    from include/linux/kernel.h:14,
                    from include/linux/list.h:9,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:17,
                    from include/linux/fsi.h:18,
                    from drivers/fsi//clients/fsi-sbefifo.c:6:
   drivers/fsi//clients/fsi-sbefifo.c: In function 'sbefifo_drain':
>> drivers/fsi//clients/fsi-sbefifo.c:359:21: warning: format '%d' expects argument of type 'int', but argument 7 has type 'ssize_t {aka long int}' [-Wformat=]
     dev_dbg(fifo->dev, "%s: valid_set: 0x%x, eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
                        ^
   include/linux/dynamic_debug.h:135:39: note: in definition of macro 'dynamic_dev_dbg'
      __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                          ^~~
>> drivers/fsi//clients/fsi-sbefifo.c:359:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(fifo->dev, "%s: valid_set: 0x%x, eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
     ^~~~~~~
   drivers/fsi//clients/fsi-sbefifo.c:359:21: warning: format '%d' expects argument of type 'int', but argument 9 has type 'ssize_t {aka long int}' [-Wformat=]
     dev_dbg(fifo->dev, "%s: valid_set: 0x%x, eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
                        ^
   include/linux/dynamic_debug.h:135:39: note: in definition of macro 'dynamic_dev_dbg'
      __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                          ^~~
>> drivers/fsi//clients/fsi-sbefifo.c:359:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(fifo->dev, "%s: valid_set: 0x%x, eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
     ^~~~~~~
   drivers/fsi//clients/fsi-sbefifo.c:378:21: warning: format '%d' expects argument of type 'int', but argument 7 has type 'ssize_t {aka long int}' [-Wformat=]
     dev_dbg(fifo->dev, "%s: Data phase complete: valid_set: 0x%x, eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
                        ^
   include/linux/dynamic_debug.h:135:39: note: in definition of macro 'dynamic_dev_dbg'
      __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                          ^~~
   drivers/fsi//clients/fsi-sbefifo.c:378:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(fifo->dev, "%s: Data phase complete: valid_set: 0x%x, eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
     ^~~~~~~
   drivers/fsi//clients/fsi-sbefifo.c:378:21: warning: format '%d' expects argument of type 'int', but argument 9 has type 'ssize_t {aka long int}' [-Wformat=]
     dev_dbg(fifo->dev, "%s: Data phase complete: valid_set: 0x%x, eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
                        ^
   include/linux/dynamic_debug.h:135:39: note: in definition of macro 'dynamic_dev_dbg'
      __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                          ^~~
   drivers/fsi//clients/fsi-sbefifo.c:378:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(fifo->dev, "%s: Data phase complete: valid_set: 0x%x, eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
     ^~~~~~~
   drivers/fsi//clients/fsi-sbefifo.c:403:21: warning: format '%d' expects argument of type 'int', but argument 7 has type 'ssize_t {aka long int}' [-Wformat=]
     dev_dbg(fifo->dev, "%s: EOT phase complete: valid_set: 0x%x, eot_set: 0x%x, nr_valid: %d\n, nr_xfer: %d, rem: %d\n",
                        ^
   include/linux/dynamic_debug.h:135:39: note: in definition of macro 'dynamic_dev_dbg'
      __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                          ^~~
   drivers/fsi//clients/fsi-sbefifo.c:403:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(fifo->dev, "%s: EOT phase complete: valid_set: 0x%x, eot_set: 0x%x, nr_valid: %d\n, nr_xfer: %d, rem: %d\n",
     ^~~~~~~
   drivers/fsi//clients/fsi-sbefifo.c:403:21: warning: format '%d' expects argument of type 'int', but argument 9 has type 'ssize_t {aka long int}' [-Wformat=]
     dev_dbg(fifo->dev, "%s: EOT phase complete: valid_set: 0x%x, eot_set: 0x%x, nr_valid: %d\n, nr_xfer: %d, rem: %d\n",
                        ^
   include/linux/dynamic_debug.h:135:39: note: in definition of macro 'dynamic_dev_dbg'
      __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                          ^~~
   drivers/fsi//clients/fsi-sbefifo.c:403:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(fifo->dev, "%s: EOT phase complete: valid_set: 0x%x, eot_set: 0x%x, nr_valid: %d\n, nr_xfer: %d, rem: %d\n",
     ^~~~~~~
   drivers/fsi//clients/fsi-sbefifo.c:417:21: warning: format '%d' expects argument of type 'int', but argument 7 has type 'ssize_t {aka long int}' [-Wformat=]
     dev_dbg(fifo->dev, "%s: Drain phase complete: valid_set: 0x%x, eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
                        ^
   include/linux/dynamic_debug.h:135:39: note: in definition of macro 'dynamic_dev_dbg'
      __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                          ^~~
   drivers/fsi//clients/fsi-sbefifo.c:417:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(fifo->dev, "%s: Drain phase complete: valid_set: 0x%x, eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
     ^~~~~~~
   drivers/fsi//clients/fsi-sbefifo.c:417:21: warning: format '%d' expects argument of type 'int', but argument 9 has type 'ssize_t {aka long int}' [-Wformat=]
     dev_dbg(fifo->dev, "%s: Drain phase complete: valid_set: 0x%x, eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
                        ^
   include/linux/dynamic_debug.h:135:39: note: in definition of macro 'dynamic_dev_dbg'
      __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                          ^~~
   drivers/fsi//clients/fsi-sbefifo.c:417:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(fifo->dev, "%s: Drain phase complete: valid_set: 0x%x, eot_set: 0x%x, nr_valid: %d, nr_xfer: %d, rem: %d\n",
     ^~~~~~~
   In file included from include/linux/list.h:9:0,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:17,
                    from include/linux/fsi.h:18,
                    from drivers/fsi//clients/fsi-sbefifo.c:6:
   drivers/fsi//clients/fsi-sbefifo.c: In function 'sbefifo_down_read':
   include/linux/kernel.h:792:16: warning: comparison of distinct pointer types lacks a cast
     (void) (&min1 == &min2);   \
                   ^
   include/linux/kernel.h:801:2: note: in expansion of macro '__min'
     __min(typeof(x), typeof(y),   \
     ^~~~~
>> drivers/fsi//clients/fsi-sbefifo.c:453:34: note: in expansion of macro 'min'
     } while (rem && read && read == min((rem + read), SBEFIFO_FIFO_DEPTH));
                                     ^~~
   drivers/fsi//clients/fsi-sbefifo.c: In function 'sbefifo_write':
   drivers/fsi//clients/fsi-sbefifo.c:557:43: warning: format '%d' expects argument of type 'int', but argument 3 has type 'ssize_t {aka long int}' [-Wformat=]
      dev_err(fifo->dev, "FIFO write failed: %d\n", rv);
                                              ^
   In file included from arch/blackfin/include/asm/bug.h:71:0,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from include/asm-generic/current.h:5,
                    from ./arch/blackfin/include/generated/asm/current.h:1,
                    from include/linux/mutex.h:14,
                    from include/linux/kernfs.h:13,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:21,
                    from include/linux/device.h:17,
                    from include/linux/fsi.h:18,
                    from drivers/fsi//clients/fsi-sbefifo.c:6:
   drivers/fsi//clients/fsi-sbefifo.c:572:17: warning: format '%d' expects argument of type 'int', but argument 4 has type 'ssize_t {aka long int}' [-Wformat=]
     WARN(rv > len, "Unreachable state: len: %d, rv: %d\n", len, rv);
                    ^
   include/asm-generic/bug.h:91:69: note: in definition of macro '__WARN_printf'
    #define __WARN_printf(arg...) warn_slowpath_fmt(__FILE__, __LINE__, arg)
                                                                        ^~~
>> drivers/fsi//clients/fsi-sbefifo.c:572:2: note: in expansion of macro 'WARN'
     WARN(rv > len, "Unreachable state: len: %d, rv: %d\n", len, rv);
     ^~~~
   drivers/fsi//clients/fsi-sbefifo.c:572:17: warning: format '%d' expects argument of type 'int', but argument 5 has type 'ssize_t {aka long int}' [-Wformat=]
     WARN(rv > len, "Unreachable state: len: %d, rv: %d\n", len, rv);
                    ^
   include/asm-generic/bug.h:91:69: note: in definition of macro '__WARN_printf'
    #define __WARN_printf(arg...) warn_slowpath_fmt(__FILE__, __LINE__, arg)
                                                                        ^~~
>> drivers/fsi//clients/fsi-sbefifo.c:572:2: note: in expansion of macro 'WARN'
     WARN(rv > len, "Unreachable state: len: %d, rv: %d\n", len, rv);
     ^~~~
   drivers/fsi//clients/fsi-sbefifo.c: In function 'sbefifo_read':
   drivers/fsi//clients/fsi-sbefifo.c:650:42: warning: format '%d' expects argument of type 'int', but argument 3 has type 'ssize_t {aka long int}' [-Wformat=]
      dev_err(fifo->dev, "FIFO read failed: %d\n", rv);
                                             ^
   drivers/fsi//clients/fsi-sbefifo.c: In function 'sbefifo_probe':
>> drivers/fsi//clients/fsi-sbefifo.c:769:2: error: implicit declaration of function 'setup_timer' [-Werror=implicit-function-declaration]
     setup_timer(&fifo->poll.timer, sbefifo_poll_device,
     ^~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/setup_timer +769 drivers/fsi//clients/fsi-sbefifo.c

   498	
   499	/**
   500	 * sbefifo_write()
   501	 *
   502	 * @client	The client context for the SBEFIFO
   503	 * @buf		The buffer of data to write, at least @len elements
   504	 * @len		The number elements in @buffer
   505	 *
   506	 * The buffer must represent a complete chip-op: EOT is signalled after the
   507	 * last element is written to the upstream FIFO.
   508	 *
   509	 * Returns the number of elements written on success and negative values on
   510	 * failure. If the call is successful a subsequent call to sbefifo_read() MUST
   511	 * be made.
   512	 */
   513	ssize_t sbefifo_write(struct sbefifo_client *client, const u32 *buf,
   514			      ssize_t len)
   515	{
   516		struct sbefifo *fifo = client->fifo;
   517		unsigned long flags;
   518		ssize_t rv;
   519	
   520		spin_lock_irqsave(&fifo->wait.lock, flags);
   521	
   522		if (client->state == sbefifo_client_active) {
   523			dev_warn(fifo->dev, "Transfer already in progress\n");
   524			spin_unlock_irqrestore(&fifo->wait.lock, flags);
   525			return -EBUSY;
   526		}
   527	
   528		rv = wait_event_interruptible_locked_irq(fifo->wait,
   529							fifo->state == sbefifo_ready ||
   530							fifo->state == sbefifo_dead);
   531		if (rv < 0) {
   532			spin_unlock_irqrestore(&fifo->wait.lock, flags);
   533			return rv;
   534		}
   535	
   536		if (fifo->state == sbefifo_dead) {
   537			client->state = sbefifo_client_closed;
   538			wake_up(&client->wait);
   539			spin_unlock_irqrestore(&fifo->wait.lock, flags);
   540			return -ENODEV;
   541		}
   542	
   543		WARN_ON(fifo->state != sbefifo_ready);
   544	
   545		fifo->curr = client;
   546		fifo->state = sbefifo_tx;
   547	
   548		/* Move a threaded read() onto waiting for FIFO read readiness */
   549		client->state = sbefifo_client_active;
   550		wake_up(&client->wait);
   551	
   552		spin_unlock_irqrestore(&fifo->wait.lock, flags);
   553	
   554		/* FIFO Tx, reset the FIFO on error */
   555		rv = sbefifo_up_write(fifo, buf, len);
   556		if (rv < len) {
   557			dev_err(fifo->dev, "FIFO write failed: %d\n", rv);
   558			rv = sbefifo_reset(fifo);
   559			if (rv < 0)
   560				return rv;
   561	
   562			spin_lock_irqsave(&fifo->wait.lock, flags);
   563			fifo->state = sbefifo_ready;
   564			client->state = sbefifo_client_idle;
   565			wake_up(&client->wait);
   566			wake_up_locked(&fifo->wait);
   567			spin_unlock_irqrestore(&fifo->wait.lock, flags);
   568	
   569			return -EIO;
   570		}
   571	
 > 572		WARN(rv > len, "Unreachable state: len: %d, rv: %d\n", len, rv);
   573	
   574		/* Write completed successfully */
   575		spin_lock_irqsave(&fifo->wait.lock, flags);
   576		fifo->state = sbefifo_interval;
   577		wake_up(&client->wait);
   578		spin_unlock_irqrestore(&fifo->wait.lock, flags);
   579	
   580		return rv;
   581	}
   582	EXPORT_SYMBOL_GPL(sbefifo_write);
   583	
   584	/**
   585	 * sbefifo_read()
   586	 *
   587	 * @client	The client context for the SBEFIFO
   588	 * @data	The buffer of data to write, at least @len elements
   589	 * @len		The number elements in @buffer
   590	 *
   591	 * Returns the number of elements read on success and negative values on
   592	 * failure. A return value of 0 indicates EOT.
   593	 */
   594	ssize_t sbefifo_read(struct sbefifo_client *client, u32 *buf, ssize_t len)
   595	{
   596		struct sbefifo *fifo = client->fifo;
   597		unsigned long flags;
   598		ssize_t rv;
   599	
   600		rv = wait_event_interruptible(client->wait,
   601					      (client->state == sbefifo_client_active ||
   602					       client->state == sbefifo_client_closed));
   603		if (rv < 0)
   604			return rv;
   605	
   606		spin_lock_irqsave(&fifo->wait.lock, flags);
   607		if (client->state == sbefifo_client_closed) {
   608			spin_unlock_irqrestore(&fifo->wait.lock, flags);
   609			return -EBADFD;
   610		}
   611	
   612		if (client->state == sbefifo_client_idle) {
   613			spin_unlock_irqrestore(&fifo->wait.lock, flags);
   614			return -EIO;
   615		}
   616	
   617		rv = wait_event_interruptible_locked_irq(fifo->wait,
   618						fifo->state == sbefifo_interval ||
   619						fifo->state == sbefifo_rx ||
   620						fifo->state == sbefifo_ready ||
   621						fifo->state == sbefifo_dead);
   622		if (rv < 0) {
   623			spin_unlock_irqrestore(&fifo->wait.lock, flags);
   624			return rv;
   625		}
   626	
   627		if (fifo->state == sbefifo_ready) {
   628			/* We've reset FIFO, whatever we were waiting for has gone */
   629			client->state = sbefifo_client_idle;
   630			/* We're done, wake another task up as the FIFO is ready */
   631			wake_up_locked(&fifo->wait);
   632			spin_unlock_irqrestore(&fifo->wait.lock, flags);
   633			return -EIO;
   634		}
   635	
   636		if (fifo->state == sbefifo_dead) {
   637			spin_unlock_irqrestore(&fifo->wait.lock, flags);
   638			return -ENODEV;
   639		}
   640	
   641		fifo->state = sbefifo_rx;
   642		spin_unlock_irqrestore(&fifo->wait.lock, flags);
   643	
   644		rv = sbefifo_down_read(fifo, buf, len);
   645		if (rv > 0)
   646			return rv;
   647	
   648		/* Reset the FIFO on error */
   649		if (rv < 0) {
   650			dev_err(fifo->dev, "FIFO read failed: %d\n", rv);
   651			rv = sbefifo_reset(fifo);
   652			if (rv < 0)
   653				return rv;
   654	
   655			rv = -EIO;
   656		}
   657	
   658		/* Read is complete one way or the other (0 length read or error) */
   659		spin_lock_irqsave(&fifo->wait.lock, flags);
   660		client->state = sbefifo_client_idle;
   661	
   662		/* Queue next FIFO transfer */
   663		fifo->curr = NULL;
   664		fifo->state = sbefifo_ready;
   665		wake_up_locked(&fifo->wait);
   666	
   667		spin_unlock_irqrestore(&fifo->wait.lock, flags);
   668	
   669		return rv;
   670	}
   671	EXPORT_SYMBOL_GPL(sbefifo_read);
   672	
   673	/**
   674	 * sbefifo_release()
   675	 *
   676	 * @client	The client context for the SBEFIFO
   677	 *
   678	 */
   679	int sbefifo_release(struct sbefifo_client *client)
   680	{
   681		struct sbefifo *fifo = client->fifo;
   682		enum sbefifo_client_state old;
   683		unsigned long flags;
   684		int rv;
   685	
   686		/* Determine if we need to clean up */
   687		spin_lock_irqsave(&client->fifo->wait.lock, flags);
   688		old = client->state;
   689		client->state = sbefifo_client_closed;
   690	
   691		if (old == sbefifo_client_closed) {
   692			spin_unlock_irqrestore(&fifo->wait.lock, flags);
   693			return -EBADFD;
   694		}
   695	
   696		if (old == sbefifo_client_idle) {
   697			spin_unlock_irqrestore(&fifo->wait.lock, flags);
   698			return 0;
   699		}
   700	
   701		/* We need to clean up, get noisy about inconsistencies */
   702		dev_warn(fifo->dev, "Releasing client with transfer in progress!\n");
   703		WARN_ON(old != sbefifo_client_active);
   704		WARN_ON(fifo->state == sbefifo_ready);
   705	
   706		/* Mark ourselves as broken for cleanup */
   707		fifo->state = sbefifo_broken;
   708		fifo->curr = NULL;
   709	
   710		wake_up(&client->wait);
   711		spin_unlock_irqrestore(&client->fifo->wait.lock, flags);
   712	
   713		/* Clean up poll waiter */
   714		spin_lock_irqsave(&fifo->poll.wait.lock, flags);
   715		del_timer_sync(&fifo->poll.timer);
   716		fifo->poll.rv = -EBADFD;
   717		wake_up_all_locked(&fifo->poll.wait);
   718		spin_unlock_irqrestore(&fifo->poll.wait.lock, flags);
   719	
   720		/* Reset the FIFO */
   721		rv = sbefifo_reset(fifo);
   722		if (rv < 0)
   723			return rv;
   724	
   725		/* Mark the FIFO as ready and wake pending transfer */
   726		spin_lock_irqsave(&client->fifo->wait.lock, flags);
   727		fifo->state = sbefifo_ready;
   728		wake_up_locked(&fifo->wait);
   729		spin_unlock_irqrestore(&client->fifo->wait.lock, flags);
   730	
   731		return 0;
   732	}
   733	EXPORT_SYMBOL_GPL(sbefifo_release);
   734	
   735	static int sbefifo_unregister_child(struct device *dev, void *data)
   736	{
   737		struct platform_device *pdev = to_platform_device(dev);
   738	
   739		of_device_unregister(pdev);
   740		if (dev->of_node)
   741			of_node_clear_flag(dev->of_node, OF_POPULATED);
   742	
   743		return 0;
   744	}
   745	
   746	static int sbefifo_probe(struct device *dev)
   747	{
   748		struct device_node *np;
   749		struct sbefifo *fifo;
   750		int child_idx;
   751		u32 up, down;
   752		int rv;
   753	
   754		fifo = devm_kzalloc(dev, sizeof(*fifo), GFP_KERNEL);
   755		if (!fifo)
   756			return -ENOMEM;
   757	
   758		fifo->dev = dev;
   759		fifo->state = sbefifo_ready;
   760		fifo->fsi = to_fsi_dev(dev);
   761	
   762		fifo->id = ida_simple_get(&sbefifo_ida, 0, 0, GFP_KERNEL);
   763		if (fifo->id < 0)
   764			return fifo->id;
   765	
   766		init_waitqueue_head(&fifo->wait);
   767	
   768		/* No interrupts, need to poll the controller */
 > 769		setup_timer(&fifo->poll.timer, sbefifo_poll_device,
   770			    (unsigned long)fifo);
   771		init_waitqueue_head(&fifo->poll.wait);
   772	
   773		rv = sbefifo_up_sts(fifo, &up);
   774		if (rv < 0)
   775			return rv;
   776	
   777		rv = sbefifo_down_sts(fifo, &down);
   778		if (rv < 0)
   779			return rv;
   780	
   781		if (!(sbefifo_empty(up) && sbefifo_empty(down)))  {
   782			dev_warn(fifo->dev, "FIFOs were not empty, requesting reset from SBE\n");
   783			/* Request the SBE reset the FIFOs */
   784			rv = sbefifo_reset(fifo);
   785			if (rv == -ETIMEDOUT) {
   786				dev_warn(fifo->dev, "SBE unresponsive, probing FIFO clients may fail. Performing hard FIFO reset\n");
   787				rv = sbefifo_do_reset(fifo);
   788				if (rv < 0)
   789					return rv;
   790			} else if (rv < 0) {
   791				return rv;
   792			}
   793		}
   794	
   795		dev_set_drvdata(dev, fifo);
   796		list_add(&fifo->entry, &sbefifos);
   797	
   798		child_idx = 0;
   799		for_each_available_child_of_node(dev->of_node, np) {
   800			struct platform_device *child;
   801			char name[32];
   802	
   803			snprintf(name, sizeof(name), "sbefifo%d-dev%d", fifo->id,
   804				 child_idx++);
   805			child = of_platform_device_create(np, name, dev);
   806			if (!child)
   807				dev_warn(dev, "Failed to create platform device %s\n",
   808					 name);
   809		}
   810	
   811		return 0;
   812	}
   813	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--sdtB3X0nJg68CQEu
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
esF7NqjPmX7/BxEppTjN4AIA

--sdtB3X0nJg68CQEu--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
