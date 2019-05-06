From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v5 5/5] [media] allegro: add SPS/PPS nal unit
 writer
Date: Mon, 6 May 2019 13:24:12 +0300
Message-ID: <20190506102412.GR2239@kadam>
References: <20190503122010.16663-6-m.tretter@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kbuild-bounces@lists.01.org>
Content-Disposition: inline
In-Reply-To: <20190503122010.16663-6-m.tretter@pengutronix.de>
List-Unsubscribe: <https://lists.01.org/mailman/options/kbuild>,
 <mailto:kbuild-request@lists.01.org?subject=unsubscribe>
List-Archive: <http://lists.01.org/pipermail/kbuild/>
List-Post: <mailto:kbuild@lists.01.org>
List-Help: <mailto:kbuild-request@lists.01.org?subject=help>
List-Subscribe: <https://lists.01.org/mailman/listinfo/kbuild>,
 <mailto:kbuild-request@lists.01.org?subject=subscribe>
Errors-To: kbuild-bounces@lists.01.org
Sender: "kbuild" <kbuild-bounces@lists.01.org>
To: kbuild@01.org
Cc: devicetree@vger.kernel.org, dshah@xilinx.com, Michael Tretter <m.tretter@pengutronix.de>, tfiga@chromium.org, hverkuil@xs4all.nl, robh+dt@kernel.org, kbuild-all@01.org, kernel@pengutronix.de, mchehab@kernel.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Michael,

url:    https://github.com/0day-ci/linux/commits/Michael-Tretter/Add-ZynqMP-VCU-Allegro-DVT-H-264-encoder-driver/20190504-161958
base:   git://linuxtv.org/media_tree.git master

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/media/platform/allegro-dvt/nal-h264.c:205 rbsp_read_bit() warn: signedness bug returning '(-22)'
drivers/media/platform/allegro-dvt/nal-h264.c:259 rbsp_read_bits() warn: unsigned 'bit' is never less than zero.

# https://github.com/0day-ci/linux/commit/eba69588199f08008a1fb4ad24e1f3e66d0080e3
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout eba69588199f08008a1fb4ad24e1f3e66d0080e3
vim +205 drivers/media/platform/allegro-dvt/nal-h264.c

eba69588 Michael Tretter 2019-05-03  188  
eba69588 Michael Tretter 2019-05-03  189  static inline bool rbsp_read_bit(struct rbsp *rbsp)
                                                        ^^^^
eba69588 Michael Tretter 2019-05-03  190  {
eba69588 Michael Tretter 2019-05-03  191  	int shift;
eba69588 Michael Tretter 2019-05-03  192  	int ofs;
eba69588 Michael Tretter 2019-05-03  193  	bool bit;
eba69588 Michael Tretter 2019-05-03  194  	int err;
eba69588 Michael Tretter 2019-05-03  195  
eba69588 Michael Tretter 2019-05-03  196  	if (rbsp->num_consecutive_zeros == 22) {
eba69588 Michael Tretter 2019-05-03  197  		err = discard_emulation_prevention_three_byte(rbsp);
eba69588 Michael Tretter 2019-05-03  198  		if (err)
eba69588 Michael Tretter 2019-05-03  199  			return err;
                                                                ^^^^^^^^^^

eba69588 Michael Tretter 2019-05-03  200  	}
eba69588 Michael Tretter 2019-05-03  201  
eba69588 Michael Tretter 2019-05-03  202  	shift = 7 - (rbsp->pos % 8);
eba69588 Michael Tretter 2019-05-03  203  	ofs = rbsp->pos / 8;
eba69588 Michael Tretter 2019-05-03  204  	if (ofs >= rbsp->size)
eba69588 Michael Tretter 2019-05-03 @205  		return -EINVAL;
                                                        ^^^^^^^^^^^^^^
Probably this function should return int instead of bool.

eba69588 Michael Tretter 2019-05-03  206  
eba69588 Michael Tretter 2019-05-03  207  	bit = (rbsp->data[ofs] >> shift) & 1;
eba69588 Michael Tretter 2019-05-03  208  
eba69588 Michael Tretter 2019-05-03  209  	rbsp->pos++;
eba69588 Michael Tretter 2019-05-03  210  
eba69588 Michael Tretter 2019-05-03  211  	if (bit == 1 ||
eba69588 Michael Tretter 2019-05-03  212  	    (rbsp->num_consecutive_zeros < 7 && (rbsp->pos % 8 == 0)))
eba69588 Michael Tretter 2019-05-03  213  		rbsp->num_consecutive_zeros = 0;
eba69588 Michael Tretter 2019-05-03  214  	else
eba69588 Michael Tretter 2019-05-03  215  		rbsp->num_consecutive_zeros++;
eba69588 Michael Tretter 2019-05-03  216  
eba69588 Michael Tretter 2019-05-03  217  	return bit;
eba69588 Michael Tretter 2019-05-03  218  }

[ snip ]

eba69588 Michael Tretter 2019-05-03  248  static inline int rbsp_read_bits(struct rbsp *rbsp, int n, unsigned int *value)
eba69588 Michael Tretter 2019-05-03  249  {
eba69588 Michael Tretter 2019-05-03  250  	int i;
eba69588 Michael Tretter 2019-05-03  251  	unsigned int bit;
                                                ^^^^^^^^^^^^^^^^

eba69588 Michael Tretter 2019-05-03  252  	unsigned int tmp = 0;
eba69588 Michael Tretter 2019-05-03  253  
eba69588 Michael Tretter 2019-05-03  254  	if (n > 8 * sizeof(*value))
eba69588 Michael Tretter 2019-05-03  255  		return -EINVAL;
eba69588 Michael Tretter 2019-05-03  256  
eba69588 Michael Tretter 2019-05-03  257  	for (i = n; i > 0; i--) {
eba69588 Michael Tretter 2019-05-03  258  		bit = rbsp_read_bit(rbsp);
eba69588 Michael Tretter 2019-05-03 @259  		if (bit < 0)
                                                            ^^^^^^^

eba69588 Michael Tretter 2019-05-03  260  			return bit;
eba69588 Michael Tretter 2019-05-03  261  		tmp |= bit << (i - 1);
eba69588 Michael Tretter 2019-05-03  262  	}
eba69588 Michael Tretter 2019-05-03  263  
eba69588 Michael Tretter 2019-05-03  264  	if (value)
eba69588 Michael Tretter 2019-05-03  265  		*value = tmp;
eba69588 Michael Tretter 2019-05-03  266  
eba69588 Michael Tretter 2019-05-03  267  	return 0;
eba69588 Michael Tretter 2019-05-03  268  }
eba69588 Michael Tretter 2019-05-03  269  
