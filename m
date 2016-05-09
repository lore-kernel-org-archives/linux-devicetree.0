From: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 03/18] dmaengine: st_fdma: Add STMicroelectronics FDMA
 engine driver support
Date: Mon, 9 May 2016 18:30:43 +0100
Message-ID: <20160509173043.GA25540@griffinp-ThinkPad-X1-Carbon-2nd>
References: <1461236675-10176-1-git-send-email-peter.griffin@linaro.org>
 <1461236675-10176-4-git-send-email-peter.griffin@linaro.org>
 <20160426165622.GR2274@localhost>
 <20160427125923.GA12756@griffinp-ThinkPad-X1-Carbon-2nd>
 <20160502093015.GD2274@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20160502093015.GD2274@localhost>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: devicetree@vger.kernel.org, arnd@arndb.de, srinivas.kandagatla@gmail.com, patrice.chotard@st.com, linux-kernel@vger.kernel.org, broonie@kernel.org, ludovic.barre@st.com, dmaengine@vger.kernel.org, lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org, maxime.coquelin@st.com
List-Id: devicetree@vger.kernel.org

Hi Vinod,

On Mon, 02 May 2016, Vinod Koul wrote:

> On Wed, Apr 27, 2016 at 01:59:23PM +0100, Peter Griffin wrote:
> > > bunch of this seems similar to cyclic case, can you create common setup
> > > routine for these, anyway cyclic is a special cases of slave_sg
> > 
> > In v4 I've made a st_fdma_prep_common() which abstracts out all the common
> > checks at the beginning of the *_prep*() functions.
> > 
> > In v3 fill_fw_node() is already (from one of your previous reviews)
> > abstracting out all the common parts from these loops. So everything
> > that is now left is actually differences between the two setups.
> > 
> > Is that Ok?
> 
> Sounds better
> 
> > > and you irq is still enabled and tasklets can be scheduled!!
> > > 
> > Eeek! Very good point. Also looking at some other drivers we
> > should be doing a of_dma_controller_free() and
> > dma_async_device_unregister().
> > 
> > So something like this: -
> > 
> >   st_fdma_disable(); /*disables irqs*/
> >   of_dma_controller_free(pdev->dev.of_node);
> >   dma_async_device_unregister(&priv->slave);
> >   st_fdma_clk_disable(fdev);
> 
> you can call devm_free_irq() explictyly, that will syncronize irq and
> free it up.

Ok will do/

> Also you should kill the tasklet afterwards.
> 
We aren't using a tasklet in this driver.

Peter.
