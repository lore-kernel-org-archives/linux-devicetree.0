Return-Path: <yajohn@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160422225048.GA30342@dtor-ws>
References: <1461319268-362-1-git-send-email-dan.huang@rad-ic.com>
	<20160422225048.GA30342@dtor-ws>
Date: Mon, 25 Apr 2016 10:48:51 +0800
Message-ID: <CAOeU-Of4G_6prZcwKOeyW6+QKD7aQvO+KO0j_nJMrgxS8L+nnw@mail.gmail.com>
Subject: Re: [PATCH] driver: input :touchscreen : add Raydium I2C touch driver
From: yajohn lin <yajohn@gmail.com>
Content-Type: multipart/alternative; boundary=94eb2c089e587c07180531463749
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: rydberg@euromail.se, Grant Likely <grant.likely@linaro.org>, robh+dt@kernel.org, jeesw@melfas.com, Benson Leung <bleung@chromium.org>, "jeffrey.lin" <jeffrey.lin@rad-ic.com>, roger.yang@rad-ic.com, KP.li@rad-ic.com, albert.shieh@rad-ic.com, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

--94eb2c089e587c07180531463749
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

hi Dmitry:
Thanks for your quickly response. We'll modify the parts you mentioned in
the mail and send update new patch before 4/26.

Thank you!

2016-04-23 6:50 GMT+08:00 Dmitry Torokhov <dmitry.torokhov@gmail.com>:

> Hi Dan,
>
> On Fri, Apr 22, 2016 at 06:01:08PM +0800, dan.huang wrote:
> > From: "jeffrey.lin" <jeffrey.lin@rad-ic.com>
> >
> > Raydium I2C touch driver.
> >
> > Signed-off-by: jeffrey.lin <jeffrey.lin@rad-ic.com>
>
> When you are sending a patch over you need to add your sign-off to it.
>
> Also I am still getting compile errors/warnings:
>
>   CC [M]  drivers/input/touchscreen/raydium_i2c_ts.o
> drivers/input/touchscreen/raydium_i2c_ts.c: In function
> =E2=80=98raydium_i2c_probe=E2=80=99:
> drivers/input/touchscreen/raydium_i2c_ts.c:1036:35: warning: =E2=80=98irq=
flags=E2=80=99
> may be used uninitialized in this function [-Wmaybe-uninitialized]
>   error =3D devm_request_threaded_irq(&client->dev, client->irq,
>
> Also please mention what is changed between previous and new version so
> I do not need to hunt for surprises.
>
> > +/*I2C command */
> > +#define CMD_BOOT_WRT         0x11
> > +#define CMD_BOOT_ACK         0x22
> > +#define CMD_BOOT_CHK         0x33
> > +#define CMD_BOOT_READ                0x44
> > +#define CMD_BOOT_WAIT_READY  0x1A
> > +#define CMD_BOOT_PATH_READY  0x1B
>
> I see that in this version the command codes are completely redone. Why
> is this? I think there is general confusion as to the encoding of the
> "header" for the command message little endian vs big endian) and
> position of the register in the header.
>
> Would you mind spelling out the format of command message, please?
>
> > +#define BOOT_RDY             0xFF
> > +#define CMD_QUERY_BANK               0x2B
> > +#define CMD_DATA_BANK                0x4D
> > +#define CMD_ENTER_SLEEP              0x4E
> > +#define CMD_BANK_SWITCH              0xAA
> > +
> > +/* Touch relative info */
> > +#define MAX_RETRIES          3
> > +#define MAX_FW_UPDATE_RETRIES        30
> > +#define MAX_TOUCH_NUM                10
> > +#define MAX_PACKET_SIZE              32
> > +#define BOOT_DELAY_MS        100
> > +
> > +#define RAYDIUM_FW_PAGESIZE          128
> > +#define RAYDIUM_POWERON_DELAY_USEC   500
> > +#define RAYDIUM_RESET_DELAY_MSEC     50
> > +
> > +#define ADDR_INDEX           0x03
> > +#define DATA_INDEX           0x04
> > +
> > +#define HEADER_SIZE          4
> > +
> > +enum raydium_boot_mode {
> > +     RAYDIUM_TS_MAIN =3D 0,
> > +     RAYDIUM_TS_BLDR,
> > +};
> > +
> > +enum raydium_abs_idx {
> > +     POS_STATE =3D 0,/*1:touch, 0:no touch*/
> > +     POS_X,
> > +     POS_Y =3D 3,
> > +     POS_PRESSURE,
> > +     WIDTH_X,
> > +     WIDTH_Y,
> > +};
> > +
> > +struct raydium_info {
> > +     u32 hw_ver;     /*device ver, __le32*/
> > +     u8 main_ver;
> > +     u8 sub_ver;
> > +     u16 ft_ver;     /*test ver, __le16*/
> > +     u8 x_num;
> > +     u8 y_num;
> > +     u16 x_max;      /*disp reso, __le16*/
> > +     u16 y_max;      /*disp reso, __le16*/
> > +     u8 x_res;               /* units/mm */
> > +     u8 y_res;               /* units/mm */
> > +};
> > +
> > +struct raydium_object {
> > +     u32 data_bank_addr;
> > +     u8 pkg_size;
> > +     u8 tp_info_size;
> > +};
> > +
> > +/* struct raydium_data - represents state of Raydium touchscreen devic=
e
> */
> > +struct raydium_data {
> > +     struct i2c_client *client;
> > +     struct input_dev *input;
> > +
> > +     struct regulator *avdd;
> > +     struct regulator *vccio;
> > +     struct gpio_desc *reset_gpio;
> > +
> > +     u32 query_bank_info;
> > +
> > +     struct raydium_info info;
> > +     struct raydium_object obj;
> > +     enum raydium_boot_mode boot_mode;
> > +
> > +     struct mutex sysfs_mutex;
> > +     struct completion cmd_done;
> > +
> > +     bool wake_irq_enabled;
> > +};
> > +
> > +static int raydium_i2c_send(struct i2c_client *client,
> > +     u8 addr, u8 *data, size_t len)
> > +{
> > +     u8 buf[MAX_PACKET_SIZE + 1], idx_i;
> > +     u16 pkg_len, use_len;
> > +     int tries =3D 0;
> > +
> > +     buf[0] =3D addr;
> > +     use_len =3D len;
> > +     use_len =3D 0;
> > +
> > +     while (use_len) {
> > +             pkg_len =3D (use_len < MAX_PACKET_SIZE) ?
> > +                     use_len : MAX_PACKET_SIZE;
> > +             memcpy(&buf[1], data + idx_i*MAX_PACKET_SIZE, pkg_len);
> > +
> > +             tries =3D 0;
> > +             do {
> > +                     if (i2c_master_send(client, buf, pkg_len + 1)
> > +                             =3D=3D (pkg_len + 1))
> > +                             break;
> > +                     msleep(20);
> > +             } while (++tries < MAX_RETRIES);
> > +             idx_i++;
> > +             use_len =3D (use_len < MAX_PACKET_SIZE) ?
> > +                     0 : (use_len - MAX_PACKET_SIZE);
> > +     }
> > +
> > +     dev_err(&client->dev, "%s: i2c send failed\n", __func__);
> > +
> > +     return -EIO;
> > +}
> > +
> > +static int raydium_i2c_read(struct i2c_client *client,
> > +     u8 addr, size_t len, void *data)
> > +{
> > +     struct i2c_msg xfer[2];
> > +     int ret;
> > +
> > +     /* Write register */
> > +     xfer[0].addr =3D client->addr;
> > +     xfer[0].flags =3D 0;
> > +     xfer[0].len =3D 1;
> > +     xfer[0].buf =3D &addr;
> > +
> > +     /* Read data */
> > +     xfer[1].addr =3D client->addr;
> > +     xfer[1].flags =3D I2C_M_RD;
> > +     xfer[1].len =3D len;
> > +     xfer[1].buf =3D data;
> > +
> > +     ret =3D i2c_transfer(client->adapter, xfer, ARRAY_SIZE(xfer));
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     if (ret !=3D ARRAY_SIZE(xfer))
> > +             return -EIO;
> > +
> > +     return 0;
> > +}
> > +
> > +static int raydium_i2c_read_message(struct i2c_client *client,
> > +     u32 addr, size_t len, void *data)
> > +{
> > +     u16 pkg_size, use_len;
> > +     u8 buf[HEADER_SIZE], idx_i;
> > +     int error;
> > +
> > +     use_len =3D len;
> > +     idx_i =3D 0;
> > +     while (use_len > 0) {
> > +             pkg_size =3D (use_len < MAX_PACKET_SIZE) ?
> > +                     use_len : MAX_PACKET_SIZE;
> > +
> > +             put_unaligned_be32(addr, buf);
> > +
> > +             /*set data bank*/
> > +             error =3D raydium_i2c_send(client, CMD_BANK_SWITCH,
> > +                     (u8 *)buf, HEADER_SIZE);
> > +             /*read potints data*/
> > +             if (!error)
> > +                     error =3D raydium_i2c_read(client, buf[ADDR_INDEX=
],
> > +                             pkg_size,
> > +                             data + idx_i*MAX_PACKET_SIZE);
> > +
> > +             pkg_size +=3D MAX_PACKET_SIZE;
> > +             addr +=3D MAX_PACKET_SIZE;
> > +             use_len =3D (use_len < MAX_PACKET_SIZE) ?
> > +                     0 : (use_len - MAX_PACKET_SIZE);
> > +             idx_i++;
> > +     }
> > +
> > +     return error;
> > +}
> > +
> > +static int raydium_i2c_send_message(struct i2c_client *client,
> > +     size_t len, void *data)
> > +{
> > +     int error;
> > +     __le32 cmd;
> > +
> > +     cmd =3D get_unaligned_le32(data);
> > +
> > +     /*set data bank*/
> > +     error =3D raydium_i2c_send(client, CMD_BANK_SWITCH, (u8 *)&cmd,
> > +             HEADER_SIZE);
> > +
> > +     /*send message*/
> > +     if (!error)
> > +             error =3D raydium_i2c_send(client, ((u8 *)data)[ADDR_INDE=
X],
> > +                     data + DATA_INDEX, len);
> > +
> > +     return error;
> > +}
> > +
> > +static int raydium_i2c_sw_reset(struct i2c_client *client)
> > +{
> > +     static const u8 soft_rst_cmd[] =3D {0x40, 0x00, 0x00, 0x04, 0x01}=
;
> > +     int error;
> > +
> > +     error =3D raydium_i2c_send_message(client, ARRAY_SIZE(soft_rst_cm=
d),
> > +             (void *)soft_rst_cmd);
> > +     if (error) {
> > +             dev_err(&client->dev, "software reset failed: %d\n",
> error);
> > +             return error;
> > +     }
> > +
> > +     msleep(RAYDIUM_RESET_DELAY_MSEC);
> > +
> > +     return 0;
> > +}
> > +
> > +static int raydium_i2c_query_ts_info(struct raydium_data *ts)
> > +{
> > +     struct i2c_client *client =3D ts->client;
> > +     int error, retry_cnt;
> > +
> > +     for (retry_cnt =3D 0; retry_cnt < MAX_RETRIES; retry_cnt++) {
> > +             error =3D raydium_i2c_read(client, CMD_DATA_BANK,
> > +                     sizeof(ts->obj), (void *)&ts->obj);
> > +                     ts->obj.data_bank_addr =3D
> > +
>  get_unaligned_le32(&ts->obj.data_bank_addr);
> > +
> > +             if (!error) {
> > +                     error =3D raydium_i2c_read(client, CMD_QUERY_BANK=
,
> > +                             sizeof(ts->query_bank_info),
> > +                             (void *)&ts->query_bank_info);
> > +                     if (!error) {
> > +                             error =3D raydium_i2c_read_message(client=
,
> > +                                     ts->query_bank_info,
> sizeof(ts->info),
> > +                                     (void *)&ts->info);
> > +
> > +                             ts->info.hw_ver =3D
> > +
>  get_unaligned_le32(&ts->info.hw_ver);
> > +                             ts->info.ft_ver =3D
> > +
>  get_unaligned_le16(&ts->info.ft_ver);
> > +                             ts->info.x_max =3D
> > +
>  get_unaligned_le16(&ts->info.x_max);
> > +                             ts->info.y_max =3D
> > +
>  get_unaligned_le16(&ts->info.y_max);
> > +                             return 0;
> > +                     }
> > +             }
> > +     }
> > +     dev_err(&client->dev, "Get touch data failed: %d\n", error);
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static int raydium_i2c_fastboot(struct i2c_client *client)
> > +{
> > +     static const u8 boot_cmd[] =3D { 0x50, 0x00, 0x06, 0x20 };
> > +     u8 buf[HEADER_SIZE];
> > +     int error;
> > +
> > +     error =3D raydium_i2c_read_message(client,
> > +             get_unaligned_be32(boot_cmd),
> > +             sizeof(boot_cmd), buf);
> > +
> > +     if (!error) {
> > +             if (buf[0] =3D=3D RM_BOOT_BLDR) {
> > +                     dev_dbg(&client->dev, "boot in fastboot mode\n");
> > +                     return -EINVAL;
> > +             }
> > +             dev_dbg(&client->dev, "boot success -- 0x%x\n",
> client->addr);
> > +             return 0;
> > +     }
> > +
> > +     dev_err(&client->dev, "boot failed: %d\n", error);
> > +
> > +     return error;
> > +}
> > +
> > +static int raydium_i2c_check_fw_status(struct raydium_data *ts)
> > +{
> > +     struct i2c_client *client =3D ts->client;
> > +     static const u8 bl_area[] =3D {0x62, 0x6f, 0x6f, 0x74};
> > +     static const u8 main_area[] =3D {0x66, 0x69, 0x72, 0x6d};
> > +     u8 buf[HEADER_SIZE];
> > +     int error;
> > +
> > +     error =3D raydium_i2c_read(client, CMD_BOOT_READ, HEADER_SIZE,
> > +             (void *)buf);
> > +     if (!error) {
> > +             if (memcmp(buf, bl_area, sizeof(bl_area)))
> > +                     ts->boot_mode =3D RAYDIUM_TS_BLDR;
> > +             else if (memcmp(buf, main_area, sizeof(main_area)))
> > +                     ts->boot_mode =3D RAYDIUM_TS_MAIN;
> > +             else
> > +                     return -EINVAL;
> > +
> > +             return 0;
> > +     }
> > +
> > +     dev_err(&client->dev, "check bl status failed: %d\n", error);
> > +
> > +     return error;
> > +}
> > +
> > +static int raydium_i2c_initialize(struct raydium_data *ts)
> > +{
> > +     struct i2c_client *client =3D ts->client;
> > +     int error, retry_cnt;
> > +
> > +     for (retry_cnt =3D 0; retry_cnt < MAX_RETRIES; retry_cnt++) {
> > +             error =3D raydium_i2c_fastboot(client);
> > +             if (error) {
> > +                     /* Continue initializing if it's the last try */
> > +                     if (retry_cnt < MAX_RETRIES - 1)
> > +                             continue;
> > +             }
> > +             /* Wait for Hello packet */
> > +             msleep(BOOT_DELAY_MS);
> > +
> > +             error =3D raydium_i2c_check_fw_status(ts);
> > +             if (error) {
> > +                     dev_err(&client->dev,
> > +                             "failed to read 'hello' packet: %d\n",
> error);
> > +             }
> > +     }
> > +
> > +     if (error)
> > +             ts->boot_mode =3D RAYDIUM_TS_BLDR;
> > +     else
> > +             raydium_i2c_query_ts_info(ts);
> > +
> > +     return error;
> > +}
> > +
> > +static int raydium_i2c_recv(struct i2c_client *client, u8 *buf, size_t
> count)
> > +{
> > +     int error =3D 0;
> > +
> > +     error =3D i2c_master_recv(client, buf, count);
> > +
> > +     if (error =3D=3D count) {
> > +             error =3D 0;
> > +     } else if (error !=3D count) {
> > +             error =3D (error < 0) ? error : -EIO;
> > +             dev_err(&client->dev, "i2c recv failed (%d)\n", error);
> > +     }
> > +
> > +     return error;
> > +}
> > +
> > +static int raydium_i2c_bl_chk_state(struct i2c_client *client, u8 stat=
e)
> > +{
> > +     static const u8 ack_ok[] =3D { 0xFF, 0x39, 0x30, 0x30, 0x54 };
> > +     u8 rbuf[5];
> > +     u8 retry;
> > +     int error;
> > +
> > +     for (retry =3D 0; retry < MAX_FW_UPDATE_RETRIES; retry++) {
> > +             if (state =3D=3D CMD_BOOT_WAIT_READY) {
> > +                     error =3D raydium_i2c_recv(client, &rbuf[0], 1);
> > +                     if (!error) {
> > +                             if (rbuf[0] =3D=3D BOOT_RDY)
> > +                                     return 0;
> > +                     }
> > +             } else if (state =3D=3D CMD_BOOT_WAIT_READY) {
>
> The condition on branches is the same (CMD_BOOT_WAIT_READY).
>
> > +                     error =3D raydium_i2c_recv(client, &rbuf[0],
> > +                             sizeof(ack_ok));
> > +                     if (!error) {
> > +                             if (memcmp(rbuf, ack_ok, sizeof(ack_ok)))
> > +                                     return 0;
> > +                     }
> > +             } else
> > +                     return -EINVAL;
> > +
> > +             msleep(20);
> > +     }
> > +
> > +     return -EINVAL;
> > +}
> > +
> > +static int raydium_i2c_wrt_object(struct i2c_client *client,
> > +     u8 *data, size_t len, u8 state)
> > +{
> > +     int error =3D 0;
> > +
> > +     error =3D raydium_i2c_send(client, CMD_BOOT_WRT, data, len);
> > +     if (error) {
> > +             dev_err(&client->dev, "WRT obj command failed: %d\n",
> error);
> > +             return error;
> > +     }
> > +
> > +     error =3D raydium_i2c_send(client, CMD_BOOT_ACK, (u8 *)NULL, 0);
> > +     if (error) {
> > +             dev_err(&client->dev, "Ack obj command failed: %d\n",
> error);
> > +             return error;
> > +     }
>
> I am looking at raydium_i2c_send() implementation and it seemd to be a
> no-op with len =3D=3D 0, what gives?
>
> > +
> > +     error =3D raydium_i2c_send(client, CMD_BOOT_CHK, (u8 *)NULL, 0);
> > +     if (error) {
> > +             dev_err(&client->dev, "Boot chk failed: %d\n", error);
> > +             return error;
> > +     }
>
> Same here.
>
> > +
> > +     error =3D raydium_i2c_bl_chk_state(client, state);
> > +     if (error) {
> > +             dev_err(&client->dev, "boot trigger state failed: %d\n",
> error);
> > +             return error;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static bool raydium_i2c_boot_trigger(struct i2c_client *client)
> > +{
> > +     int error;
> > +     u8 u8_idx;
> > +     static const u8 cmd[7][6] =3D {
> > +                     {0x08, 0x0C, 0x09, 0x00, 0x50, 0xD7},
> > +                     {0x08, 0x04, 0x09, 0x00, 0x50, 0xA5},
> > +                     {0x08, 0x04, 0x09, 0x00, 0x50, 0x00},
> > +                     {0x08, 0x04, 0x09, 0x00, 0x50, 0xA5},
> > +                     {0x08, 0x0C, 0x09, 0x00, 0x50, 0x00},
> > +                     {0x06, 0x01},
> > +                     {0x02, 0xA2},
> > +             };
> > +
> > +     for (u8_idx =3D 0 ; u8_idx < 7 ; u8_idx++) {
> > +             error =3D raydium_i2c_wrt_object(client, (u8 *)cmd[u8_idx=
],
> > +                     sizeof(cmd[u8_idx]), CMD_BOOT_WAIT_READY);
>
> If you expect that for last 2 elements the sizeof(cmd[u8_idx]) will
> return 2 you are mistaken, they all will be 6.
>
> > +             if (error) {
> > +                     dev_err(&client->dev, "send boot trigger cmd
> failed: %d\n",
> > +                             error);
> > +                     return error;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int raydium_i2c_check_path(struct i2c_client *client)
> > +{
> > +     static const u8 cmd[] =3D {0x09, 0x00, 0x09, 0x00, 0x50, 0x10, 0x=
00};
> > +     int error;
> > +
> > +     error =3D raydium_i2c_wrt_object(client, (u8 *)cmd, sizeof(cmd),
> > +             CMD_BOOT_PATH_READY);
> > +     if (error) {
> > +             dev_err(&client->dev, "send chk path cmd fail: %d\n",
> error);
> > +             return error;
> > +     }
> > +
> > +     return error;
> > +}
> > +
> > +static int raydium_i2c_enter_bl(struct i2c_client *client)
> > +{
> > +     static const u8 cal_cmd[] =3D {0x00, 0x01, 0x52};
> > +     int error;
> > +
> > +     error =3D raydium_i2c_wrt_object(client, (u8 *)cal_cmd,
> > +             sizeof(cal_cmd), CMD_BOOT_WAIT_READY);
> > +     if (error) {
> > +             dev_err(&client->dev, "send jump loader cmd fail: %d\n",
> error);
> > +             return error;
> > +     }
> > +     return 0;
> > +}
> > +
> > +static int raydium_i2c_leave_bl(struct i2c_client *client)
> > +{
> > +     static const u8 leave_cmd[] =3D {0x05, 0x00};
> > +     int error;
> > +
> > +     error =3D raydium_i2c_wrt_object(client, (u8 *)leave_cmd,
> > +             sizeof(leave_cmd), CMD_BOOT_WAIT_READY);
> > +     if (error) {
> > +             dev_err(&client->dev, "send leave bl cmd fail: %d\n",
> error);
> > +             return error;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int raydium_i2c_write_checksum(struct i2c_client *client,
> > +     u16 length, u16 checksum)
> > +{
> > +     u8 checksum_cmd[] =3D {0x00, 0x05, 0x6D, 0x00, 0x00, 0x00, 0x00};
> > +     int error =3D 0;
> > +
> > +     checksum_cmd[3] =3D (u8)(length & 0xFF);
> > +     checksum_cmd[4] =3D (u8)((length & 0xFF00) >> 8);
> > +     checksum_cmd[5] =3D (u8)(checksum & 0xFF);
> > +     checksum_cmd[6] =3D (u8)((checksum & 0xFF00) >> 8);
> > +
> > +     error =3D raydium_i2c_wrt_object(client, (u8 *)checksum_cmd,
> > +             sizeof(checksum_cmd), CMD_BOOT_WAIT_READY);
> > +     if (error) {
> > +             dev_err(&client->dev, "send wrt checksum cmd fail: %d\n",
> > +                     error);
> > +             return error;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int raydium_i2c_disable_watch_dog(struct i2c_client *client)
> > +{
> > +     static const u8 cmd[] =3D {0x0A, 0xAA};
> > +     int error =3D 0;
> > +
> > +     error =3D raydium_i2c_wrt_object(client, (u8 *)cmd, sizeof(cmd),
> > +             CMD_BOOT_WAIT_READY);
> > +     if (error) {
> > +             dev_err(&client->dev, "send disable watchdog cmd fail:
> %d\n",
> > +                     error);
> > +             return error;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int raydium_i2c_fw_write_page(struct i2c_client *client,
> > +                             const void *page, size_t len)
> > +{
> > +     int error;
> > +
> > +     error =3D raydium_i2c_wrt_object(client,  (u8 *)page, len,
> > +             CMD_BOOT_WAIT_READY);
> > +     if (error) {
> > +             dev_err(&client->dev, "send page wrt cmd failed: %d\n",
> error);
> > +             return error;
> > +     }
> > +
> > +     return error;
> > +}
> > +
> > +static int raydium_i2c_do_update_firmware(struct raydium_data *ts,
> > +                                      const struct firmware *fw)
> > +{
> > +     struct i2c_client *client =3D ts->client;
> > +     u8 u8_idx;
> > +     u16 fw_length;
> > +     u16 fw_checksum;
> > +     u8 buf[RAYDIUM_FW_PAGESIZE + 2];
> > +     int page, n_fw_pages;
> > +     int error;
> > +
> > +     fw_length =3D (int)(fw->size);
> > +     if (fw_length =3D=3D 0) {
> > +             dev_err(&client->dev, "Invalid firmware length\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     if (fw_length % RAYDIUM_FW_PAGESIZE)
> > +             n_fw_pages =3D fw_length/RAYDIUM_FW_PAGESIZE;
> > +     else
> > +             n_fw_pages =3D fw_length/RAYDIUM_FW_PAGESIZE + 1;
> > +
> > +     error =3D raydium_i2c_check_fw_status(ts);
> > +     if (error) {
> > +             dev_err(&client->dev, "Unable to access IC %d\n", error);
> > +             return error;
> > +     }
> > +
> > +     if (ts->boot_mode =3D=3D RAYDIUM_TS_MAIN) {
> > +             error =3D raydium_i2c_enter_bl(client);
> > +             if (error) {
> > +                     dev_err(&client->dev, "Unable jump to boot loader
> %d\n",
> > +                             error);
> > +                     return error;
> > +             }
> > +     }
> > +
> > +     error =3D raydium_i2c_disable_watch_dog(client);
> > +     if (error) {
> > +             dev_err(&client->dev, "send disable watchdog cmd fail,
> %d\n",
> > +                     error);
> > +             return error;
> > +     }
> > +
> > +     error =3D raydium_i2c_check_path(client);
> > +     if (error) {
> > +             dev_err(&client->dev, "send chk path fail, %d\n", error);
> > +             return error;
> > +     }
> > +
> > +     error =3D raydium_i2c_boot_trigger(client);
> > +     if (error) {
> > +             dev_err(&client->dev, "send boot trigger fail, %d\n",
> error);
> > +             return error;
> > +     }
> > +
> > +     fw_checksum =3D 0;
> > +     for (page =3D 0 ; page < n_fw_pages ; page++) {
> > +             memset(buf, 0xFF, sizeof(buf));
> > +             buf[0] =3D 0x03;
> > +             if (page =3D=3D 0)
> > +                     buf[1] =3D 0x00;
> > +
> > +             memcpy(&buf[2], fw->data + page * RAYDIUM_FW_PAGESIZE,
> > +                     RAYDIUM_FW_PAGESIZE);
> > +             /*calculate chksum*/
> > +             for (u8_idx =3D 0; u8_idx < RAYDIUM_FW_PAGESIZE; u8_idx++=
)
> > +                     fw_checksum +=3D buf[2 + u8_idx];
> > +
> > +             error =3D raydium_i2c_fw_write_page(client, (const void
> *)buf,
> > +                     sizeof(buf));
> > +             if (error) {
> > +                     dev_err(&client->dev, "flash page write fail,
> %d\n",
> > +                             error);
> > +                     return error;
> > +             }
> > +
> > +             msleep(20);
> > +     }
> > +
> > +     error =3D raydium_i2c_leave_bl(client);
> > +     if (error) {
> > +             dev_err(&client->dev, "leave boot loader fail: %d\n",
> error);
> > +             return error;
> > +     }
> > +
> > +     msleep(BOOT_DELAY_MS);
> > +
> > +     error =3D raydium_i2c_check_fw_status(ts);
> > +     if (error) {
> > +             dev_err(&client->dev, "Unable to access IC %d\n", error);
> > +             return error;
> > +     }
> > +
> > +     if (ts->boot_mode =3D=3D RAYDIUM_TS_MAIN) {
> > +             error =3D raydium_i2c_write_checksum(client, fw_length,
> > +                     fw_checksum);
> > +             if (error) {
> > +                     dev_err(&client->dev, "write checksum fail %d\n",
> > +                             error);
> > +                     return error;
> > +             }
> > +     } else {
> > +             dev_err(&client->dev, "switch to main_fw fail %d\n",
> error);
> > +             return -EINVAL;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int raydium_i2c_fw_update(struct raydium_data *ts)
> > +{
> > +     struct i2c_client *client =3D ts->client;
> > +     const struct firmware *fw =3D NULL;
> > +     const char *fn =3D "raydium.fw";
> > +     int error;
> > +
> > +     error =3D request_firmware(&fw, fn, &client->dev);
> > +     if (error) {
> > +             dev_err(&client->dev, "Unable to open firmware %s\n", fn)=
;
> > +             return error;
> > +     }
> > +     /*disable irq*/
> > +     disable_irq(client->irq);
> > +
> > +     error =3D raydium_i2c_do_update_firmware(ts, fw);
> > +     if (error) {
> > +             dev_err(&client->dev, "firmware update failed: %d\n",
> error);
> > +             ts->boot_mode =3D RAYDIUM_TS_BLDR;
> > +             goto out_enable_irq;
> > +     }
> > +
> > +     error =3D raydium_i2c_initialize(ts);
> > +     if (error) {
> > +             dev_err(&client->dev,
> > +                     "failed to initialize device after firmware
> update: %d\n",
> > +                     error);
> > +             ts->boot_mode =3D RAYDIUM_TS_BLDR;
> > +             goto out_enable_irq;
> > +     }
> > +
> > +     ts->boot_mode =3D RAYDIUM_TS_MAIN;
> > +
> > +out_enable_irq:
> > +     enable_irq(client->irq);
> > +     msleep(100);
> > +
> > +     return error;
> > +}
> > +
> > +static void raydium_mt_event(struct raydium_data *ts)
> > +{
> > +     u8 data[MAX_PACKET_SIZE];
> > +     int error, i;
> > +     int x, y, f_state, pressure, wx, wy;
> > +
> > +     error =3D raydium_i2c_read_message(ts->client,
> ts->obj.data_bank_addr,
> > +             ts->obj.pkg_size, (void *)data);
> > +
> > +     if (error < 0) {
> > +             dev_err(&ts->client->dev, "%s: failed to read data: %d\n"=
,
> > +                     __func__, error);
> > +             return;
> > +     }
> > +
> > +     for (i =3D 0; i < MAX_TOUCH_NUM; i++) {
> > +             f_state =3D (data + i * ts->obj.tp_info_size)[POS_STATE];
> > +             pressure =3D (data + i * ts->obj.tp_info_size)[POS_PRESSU=
RE];
> > +             wx =3D (data + i * ts->obj.tp_info_size)[WIDTH_X];
> > +             wy =3D (data + i * ts->obj.tp_info_size)[WIDTH_Y];
> > +
> > +             input_mt_slot(ts->input, i);
> > +             input_mt_report_slot_state(ts->input,
> > +                             MT_TOOL_FINGER, f_state !=3D 0);
> > +
> > +             if (!f_state)
> > +                     continue;
> > +             x =3D get_unaligned_le16(&data[i * ts->obj.tp_info_size +
> POS_X]);
> > +             y =3D get_unaligned_le16(&data[i * ts->obj.tp_info_size +
> POS_Y]);
> > +
> > +             input_report_abs(ts->input, ABS_MT_POSITION_X, x);
> > +             input_report_abs(ts->input, ABS_MT_POSITION_Y, y);
> > +             input_report_abs(ts->input, ABS_MT_PRESSURE, pressure);
> > +             input_report_abs(ts->input, ABS_MT_TOUCH_MAJOR,
> > +                     max(wx, wy));
> > +             input_report_abs(ts->input, ABS_MT_TOUCH_MINOR,
> > +                     min(wx, wy));
> > +     }
> > +
> > +     input_mt_sync_frame(ts->input);
> > +     input_sync(ts->input);
> > +}
> > +
> > +static irqreturn_t raydium_i2c_irq(int irq, void *_dev)
> > +{
> > +     struct raydium_data *ts =3D _dev;
> > +
> > +     if (ts->boot_mode !=3D RAYDIUM_TS_BLDR)
> > +             raydium_mt_event(ts);
> > +
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +static ssize_t raydium_calibrate(struct device *dev,
> > +                                struct device_attribute *attr,
> > +                                const char *buf, size_t count)
> > +{
> > +     struct raydium_data *ts =3D dev_get_drvdata(dev);
> > +     struct i2c_client *client =3D ts->client;
> > +
> > +     static const u8 cal_cmd[] =3D {0x00, 0x01, 0x9E};
> > +     int error =3D 0;
> > +
> > +     error =3D raydium_i2c_wrt_object(client, (u8 *)cal_cmd,
> sizeof(cal_cmd),
> > +             CMD_BOOT_WAIT_READY);
> > +     if (error) {
> > +             dev_err(&client->dev, "send chk path cmd fail: %d\n",
> error);
> > +             return error;
> > +     }
> > +
> > +     return error;
> > +}
> > +
> > +static ssize_t write_update_fw(struct device *dev,
> > +                     struct device_attribute *attr,
> > +                     const char *buf, size_t count)
> > +{
> > +     struct raydium_data *ts =3D dev_get_drvdata(dev);
> > +     int error;
> > +
> > +     error =3D mutex_lock_interruptible(&ts->sysfs_mutex);
> > +     if (error)
> > +             return error;
> > +
> > +     error =3D raydium_i2c_fw_update(ts);
> > +     dev_dbg(dev, "firmware update result: %d\n", error);
> > +
> > +     mutex_unlock(&ts->sysfs_mutex);
> > +     return error ?: count;
> > +}
> > +
> > +static ssize_t raydium_bootmode_show(struct device *dev,
> > +             struct device_attribute *attr, char *buf)
> > +{
> > +     struct raydium_data *ts =3D dev_get_drvdata(dev);
> > +
> > +     return sprintf(buf, "%s\n", ts->boot_mode =3D=3D RAYDIUM_TS_MAIN =
?
> > +             "Normal" : "Recovery");
> > +}
> > +
> > +static ssize_t raydium_fw_ver_show(struct device *dev,
> > +                     struct device_attribute *attr, char *buf)
> > +{
> > +     struct raydium_data *ts =3D dev_get_drvdata(dev);
> > +
> > +     return sprintf(buf, "%d.%d\n", ts->info.main_ver,
> ts->info.sub_ver);
> > +}
> > +
> > +static ssize_t raydium_hw_ver_show(struct device *dev,
> > +                     struct device_attribute *attr, char *buf)
> > +{
> > +     struct raydium_data *ts =3D dev_get_drvdata(dev);
> > +
> > +     return sprintf(buf, "0x%04x\n", ts->info.hw_ver);
>
> "%#04x\n"
>
> > +}
> > +
> > +static DEVICE_ATTR(fw_version, S_IRUGO, raydium_fw_ver_show, NULL);
> > +static DEVICE_ATTR(hw_version, S_IRUGO, raydium_hw_ver_show, NULL);
> > +static DEVICE_ATTR(boot_mode, S_IRUGO, raydium_bootmode_show, NULL);
> > +static DEVICE_ATTR(update_fw, S_IWUSR, NULL, write_update_fw);
> > +static DEVICE_ATTR(calibrate, S_IWUSR, NULL, raydium_calibrate);
> > +
> > +static struct attribute *raydium_attributes[] =3D {
> > +     &dev_attr_update_fw.attr,
> > +     &dev_attr_boot_mode.attr,
> > +     &dev_attr_fw_version.attr,
> > +     &dev_attr_hw_version.attr,
> > +     &dev_attr_calibrate.attr,
> > +     NULL
> > +};
> > +
> > +static struct attribute_group raydium_attribute_group =3D {
> > +     .attrs =3D raydium_attributes,
> > +};
> > +
> > +static void raydium_i2c_remove_sysfs_group(void *_data)
> > +{
> > +     struct raydium_data *ts =3D _data;
> > +
> > +     sysfs_remove_group(&ts->client->dev.kobj,
> &raydium_attribute_group);
> > +}
> > +
> > +static int raydium_i2c_power_on(struct raydium_data *ts)
> > +{
> > +     int error;
> > +
> > +     if (IS_ERR_OR_NULL(ts->reset_gpio))
> > +             return 0;
> > +
> > +     gpiod_set_value_cansleep(ts->reset_gpio, 1);
> > +
> > +     error =3D regulator_enable(ts->avdd);
> > +     if (error) {
> > +             dev_err(&ts->client->dev,
> > +                     "failed to enable avdd regulator: %d\n", error);
> > +             goto release_reset_gpio;
> > +     }
> > +
> > +     error =3D regulator_enable(ts->vccio);
> > +     if (error) {
> > +             regulator_disable(ts->avdd);
> > +             dev_err(&ts->client->dev,
> > +                     "failed to enable vccio regulator: %d\n", error);
> > +             goto release_reset_gpio;
> > +     }
> > +
> > +     udelay(RAYDIUM_POWERON_DELAY_USEC);
> > +
> > +release_reset_gpio:
> > +     gpiod_set_value_cansleep(ts->reset_gpio, 0);
> > +
> > +     if (error)
> > +             return error;
> > +
> > +     msleep(RAYDIUM_RESET_DELAY_MSEC);
> > +
> > +     return 0;
> > +}
> > +
> > +static void raydium_i2c_power_off(void *_data)
> > +{
> > +     struct raydium_data *ts =3D _data;
> > +
> > +     if (!IS_ERR_OR_NULL(ts->reset_gpio)) {
> > +             gpiod_set_value_cansleep(ts->reset_gpio, 1);
> > +             regulator_disable(ts->vccio);
> > +             regulator_disable(ts->avdd);
> > +     }
> > +}
> > +
> > +static int raydium_i2c_probe(struct i2c_client *client,
> > +                         const struct i2c_device_id *id)
> > +{
> > +     union i2c_smbus_data dummy;
> > +     struct raydium_data *ts;
> > +     unsigned long irqflags;
> > +     int error;
> > +
> > +     if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
> > +             dev_err(&client->dev,
> > +                     "%s: i2c check functionality error\n",
> DEVICE_NAME);
> > +             return -ENXIO;
> > +     }
> > +
> > +     ts =3D devm_kzalloc(&client->dev, sizeof(struct raydium_data),
> > +             GFP_KERNEL);
> > +     if (!ts)
> > +             return -ENOMEM;
> > +
> > +     mutex_init(&ts->sysfs_mutex);
> > +     init_completion(&ts->cmd_done);
> > +
> > +     ts->client =3D client;
> > +     i2c_set_clientdata(client, ts);
> > +
> > +     ts->avdd =3D devm_regulator_get(&client->dev, "avdd");
> > +     if (IS_ERR(ts->avdd)) {
> > +             error =3D PTR_ERR(ts->avdd);
> > +             if (error !=3D -EPROBE_DEFER)
> > +                     dev_err(&client->dev,
> > +                             "Failed to get 'avdd' regulator: %d\n",
> error);
> > +             return error;
> > +     }
> > +
> > +     ts->vccio =3D devm_regulator_get(&client->dev, "vccio");
> > +     if (IS_ERR(ts->vccio)) {
> > +             error =3D PTR_ERR(ts->vccio);
> > +             if (error !=3D -EPROBE_DEFER)
> > +                     dev_err(&client->dev,
> > +                             "Failed to get 'vccio' regulator: %d\n",
> error);
> > +             return error;
> > +     }
> > +
> > +     ts->reset_gpio =3D devm_gpiod_get_optional(&client->dev, "reset",
> > +             GPIOD_OUT_LOW);
> > +     if (IS_ERR(ts->reset_gpio)) {
> > +             error =3D PTR_ERR(ts->reset_gpio);
> > +             if (error !=3D -EPROBE_DEFER) {
> > +                     dev_err(&client->dev,
> > +                             "failed to get reset gpio: %d\n", error);
> > +                     return error;
> > +             }
> > +     }
> > +
> > +     error =3D raydium_i2c_power_on(ts);
> > +     if (error)
> > +             return error;
> > +
> > +     error =3D devm_add_action(&client->dev, raydium_i2c_power_off, ts=
);
> > +     if (error) {
> > +             dev_err(&client->dev,
> > +                     "failed to install power off action: %d\n", error=
);
> > +             raydium_i2c_power_off(ts);
> > +             return error;
> > +     }
> > +
> > +     /* Make sure there is something at this address */
> > +     if (i2c_smbus_xfer(client->adapter, client->addr, 0,
> > +                     I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE, &dummy) < 0) {
> > +             dev_err(&client->dev, "nothing at this address\n");
> > +             return -ENXIO;
> > +     }
> > +
> > +     error =3D raydium_i2c_initialize(ts);
> > +     if (error) {
> > +             dev_err(&client->dev, "failed to initialize: %d\n", error=
);
> > +             return error;
> > +     }
> > +
> > +     ts->input =3D devm_input_allocate_device(&client->dev);
> > +     if (!ts->input) {
> > +             dev_err(&client->dev, "Failed to allocate input device\n"=
);
> > +             return -ENOMEM;
> > +     }
> > +
> > +     ts->input->name =3D "Raydium Touchscreen";
> > +     ts->input->id.bustype =3D BUS_I2C;
> > +
> > +     __set_bit(BTN_TOUCH, ts->input->keybit);
> > +     __set_bit(EV_ABS, ts->input->evbit);
> > +     __set_bit(EV_KEY, ts->input->evbit);
>
> These 3 __set_bits() are not needed, the calls below will take care of
> setting needed bits.
>
> > +
> > +     /* Multitouch input params setup */
> > +     input_set_abs_params(ts->input, ABS_MT_POSITION_X, 0,
> > +             ts->info.x_max, 0, 0);
> > +     input_set_abs_params(ts->input, ABS_MT_POSITION_Y,
> > +             0, ts->info.y_max, 0, 0);
> > +     input_set_abs_params(ts->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0)=
;
> > +     input_set_abs_params(ts->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
> > +     input_abs_set_res(ts->input, ABS_MT_POSITION_X, ts->info.x_res);
> > +     input_abs_set_res(ts->input, ABS_MT_POSITION_Y, ts->info.y_res);
> > +
> > +     input_set_drvdata(ts->input, ts);
> > +
> > +     error =3D input_mt_init_slots(ts->input, MAX_TOUCH_NUM,
> > +             INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
> > +     if (error) {
> > +             dev_err(&client->dev,
> > +                     "failed to initialize MT slots: %d\n", error);
> > +             return error;
> > +     }
> > +
> > +     error =3D input_register_device(ts->input);
> > +     if (error) {
> > +             dev_err(&client->dev,
> > +                     "unable to register input device: %d\n", error);
> > +             return error;
> > +     }
> > +
> > +     error =3D devm_request_threaded_irq(&client->dev, client->irq,
> > +                     NULL, raydium_i2c_irq, irqflags | IRQF_ONESHOT,
> > +                     client->name, ts);
> > +     if (error) {
> > +             dev_err(&client->dev, "Failed to register interrupt\n");
> > +             return error;
> > +     }
> > +
> > +     device_init_wakeup(&client->dev, true);
>
> Please remove and rely on I2C core to enable wakeup for the device.
> I know that is does not do that for ACPI-backed devices yet, but that is
> something that we need to change there, not in the driver.
>
> > +
> > +     error =3D sysfs_create_group(&client->dev.kobj,
> &raydium_attribute_group);
> > +     if (error) {
> > +             dev_err(&client->dev, "failed to create sysfs attributes:
> %d\n",
> > +                     error);
> > +             return error;
> > +     }
> > +
> > +     error =3D devm_add_action(&client->dev,
> > +                             raydium_i2c_remove_sysfs_group, ts);
> > +     if (error) {
> > +             raydium_i2c_remove_sysfs_group(ts);
> > +             dev_err(&client->dev,
> > +                     "Failed to add sysfs cleanup action: %d\n", error=
);
> > +             return error;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int raydium_i2c_remove(struct i2c_client *client)
> > +{
> > +     struct raydium_data *ts =3D i2c_get_clientdata(client);
> > +
> > +     input_unregister_device(ts->input);
>
> This call is not needed.
>
> > +
> > +     device_init_wakeup(&client->dev, false);
>
> If we rely on platform/i2c core to set up wakeup flag we do not need to
> reset it here.
>
> > +
> > +     mutex_destroy(&ts->sysfs_mutex);
>
> This is not needed. Because nothing in raydium_i2c_remove() is needed
> you can remove to altogether.
>
> > +
> > +     return 0;
> > +}
> > +
> > +static void __maybe_unused raydium_enter_sleep(struct i2c_client
> *client)
> > +{
> > +     static const u8 sleep_cmd[] =3D { 0x5A, 0xff, 0x00, 0x0f };
> > +     int error;
> > +
> > +     error =3D raydium_i2c_send(client, CMD_ENTER_SLEEP, (u8 *)sleep_c=
md,
> > +             sizeof(sleep_cmd));
> > +     if (error)
> > +             dev_err(&client->dev,
> > +                     "Send sleep failed: %d\n", error);
> > +}
> > +
> > +static int __maybe_unused raydium_i2c_suspend(struct device *dev)
> > +{
> > +     struct i2c_client *client =3D to_i2c_client(dev);
> > +     struct raydium_data *ts =3D i2c_get_clientdata(client);
> > +
> > +     /* Command not support in BLDR recovery mode */
> > +     if (ts->boot_mode !=3D RAYDIUM_TS_MAIN)
> > +             return -EBUSY;
> > +
> > +     disable_irq(client->irq);
> > +
> > +     if (device_may_wakeup(dev)) {
> > +             raydium_enter_sleep(client);
> > +
> > +             ts->wake_irq_enabled =3D (enable_irq_wake(client->irq) =
=3D=3D 0);
> > +     } else {
> > +             raydium_i2c_power_off(ts);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int __maybe_unused raydium_i2c_resume(struct device *dev)
> > +{
> > +     struct i2c_client *client =3D to_i2c_client(dev);
> > +     struct raydium_data *ts =3D i2c_get_clientdata(client);
> > +
> > +     if (device_may_wakeup(dev)) {
> > +             if (ts->wake_irq_enabled)
> > +                     disable_irq_wake(client->irq);
> > +             raydium_i2c_sw_reset(client);
> > +     } else {
> > +             raydium_i2c_power_on(ts);
> > +             raydium_i2c_initialize(ts);
> > +     }
> > +
> > +     enable_irq(client->irq);
> > +
> > +     return 0;
> > +}
> > +
> > +static SIMPLE_DEV_PM_OPS(raydium_i2c_pm_ops,
> > +                      raydium_i2c_suspend, raydium_i2c_resume);
> > +
> > +static const struct i2c_device_id raydium_i2c_id[] =3D {
> > +     { DEVICE_NAME, 0 },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, raydium_i2c_id);
> > +
> > +#ifdef CONFIG_ACPI
> > +static const struct acpi_device_id raydium_acpi_id[] =3D {
> > +     { "RAYD0001", 0 },
> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(acpi, raydium_acpi_id);
> > +#endif
> > +
> > +#ifdef CONFIG_OF
> > +static const struct of_device_id raydium_of_match[] =3D {
> > +     { .compatible =3D "raydium,rm32380",},
> > +     { /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, raydium_of_match);
> > +#endif
> > +
> > +static struct i2c_driver raydium_i2c_driver =3D {
> > +     .probe =3D raydium_i2c_probe,
> > +     .remove =3D raydium_i2c_remove,
> > +     .id_table =3D raydium_i2c_id,
> > +     .driver =3D {
> > +             .name =3D "raydium_ts",
> > +             .pm =3D &raydium_i2c_pm_ops,
> > +             .acpi_match_table =3D ACPI_PTR(raydium_acpi_id),
> > +             .of_match_table =3D of_match_ptr(raydium_of_match),
> > +     },
> > +};
> > +
> > +module_i2c_driver(raydium_i2c_driver);
> > +
> > +MODULE_AUTHOR("Raydium");
> > +MODULE_DESCRIPTION("Raydium I2c Touchscreen driver");
> > +MODULE_LICENSE("GPL v2");
> > --
> > 2.1.2
> >
>
> Thanks.
>
> --
> Dmitry
>

--94eb2c089e587c07180531463749
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>hi Dmitry:<br></div>Thanks for your quickly resp=
onse. We&#39;ll modify the parts you mentioned in the mail and send update =
new patch before 4/26.<br><br></div>Thank you!<br></div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">2016-04-23 6:50 GMT+08:00 Dmitry Tor=
okhov <span dir=3D"ltr">&lt;<a href=3D"mailto:dmitry.torokhov@gmail.com" ta=
rget=3D"_blank">dmitry.torokhov@gmail.com</a>&gt;</span>:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">Hi Dan,<br>
<span class=3D""><br>
On Fri, Apr 22, 2016 at 06:01:08PM +0800, dan.huang wrote:<br>
&gt; From: &quot;jeffrey.lin&quot; &lt;<a href=3D"mailto:jeffrey.lin@rad-ic=
.com">jeffrey.lin@rad-ic.com</a>&gt;<br>
&gt;<br>
&gt; Raydium I2C touch driver.<br>
&gt;<br>
&gt; Signed-off-by: jeffrey.lin &lt;<a href=3D"mailto:jeffrey.lin@rad-ic.co=
m">jeffrey.lin@rad-ic.com</a>&gt;<br>
<br>
</span>When you are sending a patch over you need to add your sign-off to i=
t.<br>
<br>
Also I am still getting compile errors/warnings:<br>
<br>
=C2=A0 CC [M]=C2=A0 drivers/input/touchscreen/raydium_i2c_ts.o<br>
drivers/input/touchscreen/raydium_i2c_ts.c: In function<br>
=E2=80=98raydium_i2c_probe=E2=80=99:<br>
drivers/input/touchscreen/raydium_i2c_ts.c:1036:35: warning: =E2=80=98irqfl=
ags=E2=80=99<br>
may be used uninitialized in this function [-Wmaybe-uninitialized]<br>
<span class=3D"">=C2=A0 error =3D devm_request_threaded_irq(&amp;client-&gt=
;dev, client-&gt;irq,<br>
<br>
</span>Also please mention what is changed between previous and new version=
 so<br>
I do not need to hunt for surprises.<br>
<span class=3D""><br>
&gt; +/*I2C command */<br>
&gt; +#define CMD_BOOT_WRT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x11<br>
&gt; +#define CMD_BOOT_ACK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x22<br>
&gt; +#define CMD_BOOT_CHK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x33<br>
&gt; +#define CMD_BOOT_READ=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x44<br>
&gt; +#define CMD_BOOT_WAIT_READY=C2=A0 0x1A<br>
&gt; +#define CMD_BOOT_PATH_READY=C2=A0 0x1B<br>
<br>
</span>I see that in this version the command codes are completely redone. =
Why<br>
is this? I think there is general confusion as to the encoding of the<br>
&quot;header&quot; for the command message little endian vs big endian) and=
<br>
position of the register in the header.<br>
<br>
Would you mind spelling out the format of command message, please?<br>
<div><div class=3D"h5"><br>
&gt; +#define BOOT_RDY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00xFF<=
br>
&gt; +#define CMD_QUERY_BANK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x2B<br>
&gt; +#define CMD_DATA_BANK=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x4D<br>
&gt; +#define CMD_ENTER_SLEEP=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x4E<br>
&gt; +#define CMD_BANK_SWITCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0xAA<br>
&gt; +<br>
&gt; +/* Touch relative info */<br>
&gt; +#define MAX_RETRIES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3<br>
&gt; +#define MAX_FW_UPDATE_RETRIES=C2=A0 =C2=A0 =C2=A0 =C2=A0 30<br>
&gt; +#define MAX_TOUCH_NUM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 10<br>
&gt; +#define MAX_PACKET_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 32<br>
&gt; +#define BOOT_DELAY_MS=C2=A0 =C2=A0 =C2=A0 =C2=A0 100<br>
&gt; +<br>
&gt; +#define RAYDIUM_FW_PAGESIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 128<br>
&gt; +#define RAYDIUM_POWERON_DELAY_USEC=C2=A0 =C2=A0500<br>
&gt; +#define RAYDIUM_RESET_DELAY_MSEC=C2=A0 =C2=A0 =C2=A050<br>
&gt; +<br>
&gt; +#define ADDR_INDEX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x03<br>
&gt; +#define DATA_INDEX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x04<br>
&gt; +<br>
&gt; +#define HEADER_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4<br>
&gt; +<br>
&gt; +enum raydium_boot_mode {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0RAYDIUM_TS_MAIN =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0RAYDIUM_TS_BLDR,<br>
&gt; +};<br>
&gt; +<br>
&gt; +enum raydium_abs_idx {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0POS_STATE =3D 0,/*1:touch, 0:no touch*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0POS_X,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0POS_Y =3D 3,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0POS_PRESSURE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0WIDTH_X,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0WIDTH_Y,<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct raydium_info {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 hw_ver;=C2=A0 =C2=A0 =C2=A0/*device ver, __le=
32*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 main_ver;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 sub_ver;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 ft_ver;=C2=A0 =C2=A0 =C2=A0/*test ver, __le16=
*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 x_num;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 y_num;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 x_max;=C2=A0 =C2=A0 =C2=A0 /*disp reso, __le1=
6*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 y_max;=C2=A0 =C2=A0 =C2=A0 /*disp reso, __le1=
6*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 x_res;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* units/mm */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 y_res;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* units/mm */<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct raydium_object {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 data_bank_addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 pkg_size;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 tp_info_size;<br>
&gt; +};<br>
&gt; +<br>
&gt; +/* struct raydium_data - represents state of Raydium touchscreen devi=
ce */<br>
&gt; +struct raydium_data {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_client *client;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct input_dev *input;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regulator *avdd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regulator *vccio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gpio_desc *reset_gpio;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 query_bank_info;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct raydium_info info;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct raydium_object obj;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0enum raydium_boot_mode boot_mode;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mutex sysfs_mutex;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct completion cmd_done;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool wake_irq_enabled;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static int raydium_i2c_send(struct i2c_client *client,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 addr, u8 *data, size_t len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 buf[MAX_PACKET_SIZE + 1], idx_i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 pkg_len, use_len;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int tries =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0buf[0] =3D addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0use_len =3D len;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0use_len =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0while (use_len) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg_len =3D (use_len =
&lt; MAX_PACKET_SIZE) ?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0use_len : MAX_PACKET_SIZE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(&amp;buf[1], d=
ata + idx_i*MAX_PACKET_SIZE, pkg_len);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tries =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0do {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (i2c_master_send(client, buf, pkg_len + 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D=3D (pkg_len + 1))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0msleep(20);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} while (++tries &lt;=
 MAX_RETRIES);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0idx_i++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0use_len =3D (use_len =
&lt; MAX_PACKET_SIZE) ?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A00 : (use_len - MAX_PACKET_SIZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&gt;dev, &quot;%s: i2c send f=
ailed\n&quot;, __func__);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -EIO;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_read(struct i2c_client *client,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 addr, size_t len, void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_msg xfer[2];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Write register */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xfer[0].addr =3D client-&gt;addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xfer[0].flags =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xfer[0].len =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xfer[0].buf =3D &amp;addr;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Read data */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xfer[1].addr =3D client-&gt;addr;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xfer[1].flags =3D I2C_M_RD;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xfer[1].len =3D len;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0xfer[1].buf =3D data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D i2c_transfer(client-&gt;adapter, xfer, AR=
RAY_SIZE(xfer));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret !=3D ARRAY_SIZE(xfer))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EIO;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_read_message(struct i2c_client *client,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 addr, size_t len, void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 pkg_size, use_len;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 buf[HEADER_SIZE], idx_i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0use_len =3D len;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0idx_i =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0while (use_len &gt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg_size =3D (use_len=
 &lt; MAX_PACKET_SIZE) ?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0use_len : MAX_PACKET_SIZE;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0put_unaligned_be32(ad=
dr, buf);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*set data bank*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c=
_send(client, CMD_BANK_SWITCH,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0(u8 *)buf, HEADER_SIZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*read potints data*/=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!error)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0error =3D raydium_i2c_read(client, buf[ADDR_INDEX],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg_size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0data + idx_i*MAX_PACKET_SIZE);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkg_size +=3D MAX_PAC=
KET_SIZE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr +=3D MAX_PACKET_=
SIZE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0use_len =3D (use_len =
&lt; MAX_PACKET_SIZE) ?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A00 : (use_len - MAX_PACKET_SIZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0idx_i++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_send_message(struct i2c_client *client,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0size_t len, void *data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__le32 cmd;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0cmd =3D get_unaligned_le32(data);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*set data bank*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_send(client, CMD_BANK_SWITC=
H, (u8 *)&amp;cmd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HEADER_SIZE);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*send message*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!error)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c=
_send(client, ((u8 *)data)[ADDR_INDEX],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0data + DATA_INDEX, len);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_sw_reset(struct i2c_client *client)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0static const u8 soft_rst_cmd[] =3D {0x40, 0x00, 0=
x00, 0x04, 0x01};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_send_message(client, ARRAY_=
SIZE(soft_rst_cmd),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void *)soft_rst_cmd)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;software reset failed: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msleep(RAYDIUM_RESET_DELAY_MSEC);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_query_ts_info(struct raydium_data *ts)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_client *client =3D ts-&gt;client;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error, retry_cnt;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (retry_cnt =3D 0; retry_cnt &lt; MAX_RETRIES;=
 retry_cnt++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c=
_read(client, CMD_DATA_BANK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0sizeof(ts-&gt;obj), (void *)&amp;ts-&gt;obj);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ts-&gt;obj.data_bank_addr =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_unaligned_le32(&amp;ts-&gt;obj.data_=
bank_addr);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0error =3D raydium_i2c_read(client, CMD_QUERY_BANK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(ts-&gt;query_bank_info),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void *)&amp;ts-&gt;query_bank_info);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (!error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_read_message(clien=
t,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts-&gt;query=
_bank_info, sizeof(ts-&gt;info),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void *)&amp=
;ts-&gt;info);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts-&gt;info.hw_ver =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_unaligne=
d_le32(&amp;ts-&gt;info.hw_ver);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts-&gt;info.ft_ver =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_unaligne=
d_le16(&amp;ts-&gt;info.ft_ver);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts-&gt;info.x_max =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_unaligne=
d_le16(&amp;ts-&gt;info.x_max);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts-&gt;info.y_max =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_unaligne=
d_le16(&amp;ts-&gt;info.y_max);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&gt;dev, &quot;Get touch data=
 failed: %d\n&quot;, error);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_fastboot(struct i2c_client *client)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0static const u8 boot_cmd[] =3D { 0x50, 0x00, 0x06=
, 0x20 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 buf[HEADER_SIZE];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_read_message(client,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_unaligned_be32(bo=
ot_cmd),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(boot_cmd), buf=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (buf[0] =3D=3D RM_=
BOOT_BLDR) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_dbg(&amp;client-&gt;dev, &quot;boot in fastboot mode\n&quot;);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_dbg(&amp;client-&=
gt;dev, &quot;boot success -- 0x%x\n&quot;, client-&gt;addr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&gt;dev, &quot;boot failed: %=
d\n&quot;, error);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_check_fw_status(struct raydium_data *ts)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_client *client =3D ts-&gt;client;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0static const u8 bl_area[] =3D {0x62, 0x6f, 0x6f, =
0x74};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0static const u8 main_area[] =3D {0x66, 0x69, 0x72=
, 0x6d};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 buf[HEADER_SIZE];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_read(client, CMD_BOOT_READ,=
 HEADER_SIZE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(void *)buf);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (memcmp(buf, bl_ar=
ea, sizeof(bl_area)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ts-&gt;boot_mode =3D RAYDIUM_TS_BLDR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (memcmp(buf, =
main_area, sizeof(main_area)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ts-&gt;boot_mode =3D RAYDIUM_TS_MAIN;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&gt;dev, &quot;check bl statu=
s failed: %d\n&quot;, error);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_initialize(struct raydium_data *ts)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_client *client =3D ts-&gt;client;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error, retry_cnt;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (retry_cnt =3D 0; retry_cnt &lt; MAX_RETRIES;=
 retry_cnt++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c=
_fastboot(client);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* Continue initializing if it&#39;s the last try */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (retry_cnt &lt; MAX_RETRIES - 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Wait for Hello pac=
ket */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msleep(BOOT_DELAY_MS)=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c=
_check_fw_status(ts);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;failed to read &#39;hello&#39; pac=
ket: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts-&gt;boot_mode =3D =
RAYDIUM_TS_BLDR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raydium_i2c_query_ts_=
info(ts);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_recv(struct i2c_client *client, u8 *buf, size_=
t count)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D i2c_master_recv(client, buf, count);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error =3D=3D count) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (error !=3D count) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D (error &lt;=
 0) ? error : -EIO;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;i2c recv failed (%d)\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_bl_chk_state(struct i2c_client *client, u8 sta=
te)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0static const u8 ack_ok[] =3D { 0xFF, 0x39, 0x30, =
0x30, 0x54 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 rbuf[5];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 retry;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (retry =3D 0; retry &lt; MAX_FW_UPDATE_RETRIE=
S; retry++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (state =3D=3D CMD_=
BOOT_WAIT_READY) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0error =3D raydium_i2c_recv(client, &amp;rbuf[0], 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (!error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rbuf[0] =3D=3D BOOT_RDY)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (state =3D=
=3D CMD_BOOT_WAIT_READY) {<br>
<br>
</div></div>The condition on branches is the same (CMD_BOOT_WAIT_READY).<br=
>
<div><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0error =3D raydium_i2c_recv(client, &amp;rbuf[0],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(ack_ok));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (!error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (memcmp(rbuf, ack_ok, sizeof(ack_ok))=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msleep(20);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_wrt_object(struct i2c_client *client,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 *data, size_t len, u8 state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_send(client, CMD_BOOT_WRT, =
data, len);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;WRT obj command failed: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_send(client, CMD_BOOT_ACK, =
(u8 *)NULL, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;Ack obj command failed: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
</div></div>I am looking at raydium_i2c_send() implementation and it seemd =
to be a<br>
no-op with len =3D=3D 0, what gives?<br>
<span class=3D""><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_send(client, CMD_BOOT_CHK, =
(u8 *)NULL, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;Boot chk failed: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
</span>Same here.<br>
<div><div class=3D"h5"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_bl_chk_state(client, state)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;boot trigger state failed: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool raydium_i2c_boot_trigger(struct i2c_client *client)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 u8_idx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0static const u8 cmd[7][6] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0{0x08, 0x0C, 0x09, 0x00, 0x50, 0xD7},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0{0x08, 0x04, 0x09, 0x00, 0x50, 0xA5},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0{0x08, 0x04, 0x09, 0x00, 0x50, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0{0x08, 0x04, 0x09, 0x00, 0x50, 0xA5},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0{0x08, 0x0C, 0x09, 0x00, 0x50, 0x00},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0{0x06, 0x01},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0{0x02, 0xA2},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (u8_idx =3D 0 ; u8_idx &lt; 7 ; u8_idx++) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c=
_wrt_object(client, (u8 *)cmd[u8_idx],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0sizeof(cmd[u8_idx]), CMD_BOOT_WAIT_READY);<br>
<br>
</div></div>If you expect that for last 2 elements the sizeof(cmd[u8_idx]) =
will<br>
return 2 you are mistaken, they all will be 6.<br>
<div><div class=3D"h5"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;client-&gt;dev, &quot;send boot trigger cmd failed: %d\=
n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_check_path(struct i2c_client *client)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0static const u8 cmd[] =3D {0x09, 0x00, 0x09, 0x00=
, 0x50, 0x10, 0x00};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_wrt_object(client, (u8 *)cm=
d, sizeof(cmd),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CMD_BOOT_PATH_READY);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;send chk path cmd fail: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_enter_bl(struct i2c_client *client)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0static const u8 cal_cmd[] =3D {0x00, 0x01, 0x52};=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_wrt_object(client, (u8 *)ca=
l_cmd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(cal_cmd), CMD_=
BOOT_WAIT_READY);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;send jump loader cmd fail: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_leave_bl(struct i2c_client *client)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0static const u8 leave_cmd[] =3D {0x05, 0x00};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_wrt_object(client, (u8 *)le=
ave_cmd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(leave_cmd), CM=
D_BOOT_WAIT_READY);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;send leave bl cmd fail: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_write_checksum(struct i2c_client *client,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 length, u16 checksum)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 checksum_cmd[] =3D {0x00, 0x05, 0x6D, 0x00, 0x=
00, 0x00, 0x00};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0checksum_cmd[3] =3D (u8)(length &amp; 0xFF);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0checksum_cmd[4] =3D (u8)((length &amp; 0xFF00) &g=
t;&gt; 8);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0checksum_cmd[5] =3D (u8)(checksum &amp; 0xFF);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0checksum_cmd[6] =3D (u8)((checksum &amp; 0xFF00) =
&gt;&gt; 8);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_wrt_object(client, (u8 *)ch=
ecksum_cmd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(checksum_cmd),=
 CMD_BOOT_WAIT_READY);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;send wrt checksum cmd fail: %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_disable_watch_dog(struct i2c_client *client)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0static const u8 cmd[] =3D {0x0A, 0xAA};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_wrt_object(client, (u8 *)cm=
d, sizeof(cmd),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CMD_BOOT_WAIT_READY);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;send disable watchdog cmd fail: %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_fw_write_page(struct i2c_client *client,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const void *page, size_t len)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_wrt_object(client,=C2=A0 (u=
8 *)page, len,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CMD_BOOT_WAIT_READY);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;send page wrt cmd failed: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_do_update_firmware(struct raydium_data *ts,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struc=
t firmware *fw)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_client *client =3D ts-&gt;client;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 u8_idx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 fw_length;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 fw_checksum;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 buf[RAYDIUM_FW_PAGESIZE + 2];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int page, n_fw_pages;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fw_length =3D (int)(fw-&gt;size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fw_length =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;Invalid firmware length\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (fw_length % RAYDIUM_FW_PAGESIZE)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n_fw_pages =3D fw_len=
gth/RAYDIUM_FW_PAGESIZE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n_fw_pages =3D fw_len=
gth/RAYDIUM_FW_PAGESIZE + 1;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_check_fw_status(ts);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;Unable to access IC %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ts-&gt;boot_mode =3D=3D RAYDIUM_TS_MAIN) {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c=
_enter_bl(client);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;client-&gt;dev, &quot;Unable jump to boot loader %d\n&q=
uot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_disable_watch_dog(client);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;send disable watchdog cmd fail, %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_check_path(client);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;send chk path fail, %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_boot_trigger(client);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;send boot trigger fail, %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fw_checksum =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (page =3D 0 ; page &lt; n_fw_pages ; page++) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(buf, 0xFF, siz=
eof(buf));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf[0] =3D 0x03;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (page =3D=3D 0)<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0buf[1] =3D 0x00;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memcpy(&amp;buf[2], f=
w-&gt;data + page * RAYDIUM_FW_PAGESIZE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0RAYDIUM_FW_PAGESIZE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*calculate chksum*/<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (u8_idx =3D 0; u8=
_idx &lt; RAYDIUM_FW_PAGESIZE; u8_idx++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0fw_checksum +=3D buf[2 + u8_idx];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c=
_fw_write_page(client, (const void *)buf,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0sizeof(buf));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;client-&gt;dev, &quot;flash page write fail, %d\n&quot;=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msleep(20);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_leave_bl(client);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;leave boot loader fail: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msleep(BOOT_DELAY_MS);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_check_fw_status(ts);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;Unable to access IC %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ts-&gt;boot_mode =3D=3D RAYDIUM_TS_MAIN) {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c=
_write_checksum(client, fw_length,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0fw_checksum);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;client-&gt;dev, &quot;write checksum fail %d\n&quot;,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;switch to main_fw fail %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_fw_update(struct raydium_data *ts)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_client *client =3D ts-&gt;client;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct firmware *fw =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *fn =3D &quot;raydium.fw&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D request_firmware(&amp;fw, fn, &amp;clie=
nt-&gt;dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;Unable to open firmware %s\n&quot;, fn);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*disable irq*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0disable_irq(client-&gt;irq);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_do_update_firmware(ts, fw);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;firmware update failed: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts-&gt;boot_mode =3D =
RAYDIUM_TS_BLDR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_enable_irq;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_initialize(ts);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;failed to initialize device after firmware update: %d\n&quot;,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts-&gt;boot_mode =3D =
RAYDIUM_TS_BLDR;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_enable_irq;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ts-&gt;boot_mode =3D RAYDIUM_TS_MAIN;<br>
&gt; +<br>
&gt; +out_enable_irq:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0enable_irq(client-&gt;irq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msleep(100);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void raydium_mt_event(struct raydium_data *ts)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 data[MAX_PACKET_SIZE];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error, i;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int x, y, f_state, pressure, wx, wy;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_read_message(ts-&gt;client,=
 ts-&gt;obj.data_bank_addr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts-&gt;obj.pkg_size, =
(void *)data);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;ts-&gt;c=
lient-&gt;dev, &quot;%s: failed to read data: %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0__func__, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; MAX_TOUCH_NUM; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f_state =3D (data + i=
 * ts-&gt;obj.tp_info_size)[POS_STATE];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pressure =3D (data + =
i * ts-&gt;obj.tp_info_size)[POS_PRESSURE];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wx =3D (data + i * ts=
-&gt;obj.tp_info_size)[WIDTH_X];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wy =3D (data + i * ts=
-&gt;obj.tp_info_size)[WIDTH_Y];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input_mt_slot(ts-&gt;=
input, i);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input_mt_report_slot_=
state(ts-&gt;input,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MT_TOOL_FINGER, f_state !=3D 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!f_state)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0continue;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x =3D get_unaligned_l=
e16(&amp;data[i * ts-&gt;obj.tp_info_size + POS_X]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0y =3D get_unaligned_l=
e16(&amp;data[i * ts-&gt;obj.tp_info_size + POS_Y]);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input_report_abs(ts-&=
gt;input, ABS_MT_POSITION_X, x);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input_report_abs(ts-&=
gt;input, ABS_MT_POSITION_Y, y);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input_report_abs(ts-&=
gt;input, ABS_MT_PRESSURE, pressure);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input_report_abs(ts-&=
gt;input, ABS_MT_TOUCH_MAJOR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0max(wx, wy));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0input_report_abs(ts-&=
gt;input, ABS_MT_TOUCH_MINOR,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0min(wx, wy));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0input_mt_sync_frame(ts-&gt;input);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0input_sync(ts-&gt;input);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static irqreturn_t raydium_i2c_irq(int irq, void *_dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct raydium_data *ts =3D _dev;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ts-&gt;boot_mode !=3D RAYDIUM_TS_BLDR)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raydium_mt_event(ts);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return IRQ_HANDLED;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static ssize_t raydium_calibrate(struct device *dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *attr,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *buf, size_t count)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct raydium_data *ts =3D dev_get_drvdata(dev);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_client *client =3D ts-&gt;client;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0static const u8 cal_cmd[] =3D {0x00, 0x01, 0x9E};=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_wrt_object(client, (u8 *)ca=
l_cmd, sizeof(cal_cmd),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CMD_BOOT_WAIT_READY);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;send chk path cmd fail: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static ssize_t write_update_fw(struct device *dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0struct device_attribute *attr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0const char *buf, size_t count)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct raydium_data *ts =3D dev_get_drvdata(dev);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D mutex_lock_interruptible(&amp;ts-&gt;sy=
sfs_mutex);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_fw_update(ts);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dev_dbg(dev, &quot;firmware update result: %d\n&q=
uot;, error);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;ts-&gt;sysfs_mutex);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return error ?: count;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static ssize_t raydium_bootmode_show(struct device *dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribu=
te *attr, char *buf)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct raydium_data *ts =3D dev_get_drvdata(dev);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%s\n&quot;, ts-&gt;boot=
_mode =3D=3D RAYDIUM_TS_MAIN ?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Normal&quot; : =
&quot;Recovery&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static ssize_t raydium_fw_ver_show(struct device *dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0struct device_attribute *attr, char *buf)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct raydium_data *ts =3D dev_get_drvdata(dev);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%d.%d\n&quot;, ts-&gt;i=
nfo.main_ver, ts-&gt;info.sub_ver);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static ssize_t raydium_hw_ver_show(struct device *dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0struct device_attribute *attr, char *buf)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct raydium_data *ts =3D dev_get_drvdata(dev);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;0x%04x\n&quot;, ts-&gt;=
info.hw_ver);<br>
<br>
</div></div>&quot;%#04x\n&quot;<br>
<div><div class=3D"h5"><br>
&gt; +}<br>
&gt; +<br>
&gt; +static DEVICE_ATTR(fw_version, S_IRUGO, raydium_fw_ver_show, NULL);<b=
r>
&gt; +static DEVICE_ATTR(hw_version, S_IRUGO, raydium_hw_ver_show, NULL);<b=
r>
&gt; +static DEVICE_ATTR(boot_mode, S_IRUGO, raydium_bootmode_show, NULL);<=
br>
&gt; +static DEVICE_ATTR(update_fw, S_IWUSR, NULL, write_update_fw);<br>
&gt; +static DEVICE_ATTR(calibrate, S_IWUSR, NULL, raydium_calibrate);<br>
&gt; +<br>
&gt; +static struct attribute *raydium_attributes[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&amp;dev_attr_update_fw.attr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&amp;dev_attr_boot_mode.attr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&amp;dev_attr_fw_version.attr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&amp;dev_attr_hw_version.attr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0&amp;dev_attr_calibrate.attr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0NULL<br>
&gt; +};<br>
&gt; +<br>
&gt; +static struct attribute_group raydium_attribute_group =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.attrs =3D raydium_attributes,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static void raydium_i2c_remove_sysfs_group(void *_data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct raydium_data *ts =3D _data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sysfs_remove_group(&amp;ts-&gt;client-&gt;dev.kob=
j, &amp;raydium_attribute_group);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_power_on(struct raydium_data *ts)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR_OR_NULL(ts-&gt;reset_gpio))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiod_set_value_cansleep(ts-&gt;reset_gpio, 1);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D regulator_enable(ts-&gt;avdd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;ts-&gt;c=
lient-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;failed to enable avdd regulator: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto release_reset_gp=
io;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D regulator_enable(ts-&gt;vccio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator_disable(ts-=
&gt;avdd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;ts-&gt;c=
lient-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;failed to enable vccio regulator: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto release_reset_gp=
io;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0udelay(RAYDIUM_POWERON_DELAY_USEC);<br>
&gt; +<br>
&gt; +release_reset_gpio:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gpiod_set_value_cansleep(ts-&gt;reset_gpio, 0);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msleep(RAYDIUM_RESET_DELAY_MSEC);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void raydium_i2c_power_off(void *_data)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct raydium_data *ts =3D _data;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!IS_ERR_OR_NULL(ts-&gt;reset_gpio)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_set_value_cansl=
eep(ts-&gt;reset_gpio, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator_disable(ts-=
&gt;vccio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator_disable(ts-=
&gt;avdd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_probe(struct i2c_client *client,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0const struct i2c_device_id *id)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0union i2c_smbus_data dummy;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct raydium_data *ts;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long irqflags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!i2c_check_functionality(client-&gt;adapter, =
I2C_FUNC_I2C)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;%s: i2c check functionality error\n&quot;, DEVICE_NAME);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENXIO;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ts =3D devm_kzalloc(&amp;client-&gt;dev, sizeof(s=
truct raydium_data),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!ts)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_init(&amp;ts-&gt;sysfs_mutex);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0init_completion(&amp;ts-&gt;cmd_done);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ts-&gt;client =3D client;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0i2c_set_clientdata(client, ts);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ts-&gt;avdd =3D devm_regulator_get(&amp;client-&g=
t;dev, &quot;avdd&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(ts-&gt;avdd)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D PTR_ERR(ts-=
&gt;avdd);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (error !=3D -EPROB=
E_DEFER)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Failed to get &#39;avdd&#39; regul=
ator: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ts-&gt;vccio =3D devm_regulator_get(&amp;client-&=
gt;dev, &quot;vccio&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(ts-&gt;vccio)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D PTR_ERR(ts-=
&gt;vccio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (error !=3D -EPROB=
E_DEFER)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Failed to get &#39;vccio&#39; regu=
lator: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ts-&gt;reset_gpio =3D devm_gpiod_get_optional(&am=
p;client-&gt;dev, &quot;reset&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GPIOD_OUT_LOW);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(ts-&gt;reset_gpio)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error =3D PTR_ERR(ts-=
&gt;reset_gpio);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (error !=3D -EPROB=
E_DEFER) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_err(&amp;client-&gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;failed to get reset gpio: %d\n&quo=
t;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_power_on(ts);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D devm_add_action(&amp;client-&gt;dev, ra=
ydium_i2c_power_off, ts);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;failed to install power off action: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raydium_i2c_power_off=
(ts);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Make sure there is something at this address *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (i2c_smbus_xfer(client-&gt;adapter, client-&gt=
;addr, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE, &amp;dummy) &lt; 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;nothing at this address\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENXIO;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_initialize(ts);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;failed to initialize: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ts-&gt;input =3D devm_input_allocate_device(&amp;=
client-&gt;dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!ts-&gt;input) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;Failed to allocate input device\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ts-&gt;input-&gt;name =3D &quot;Raydium Touchscre=
en&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ts-&gt;input-&gt;id.bustype =3D BUS_I2C;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__set_bit(BTN_TOUCH, ts-&gt;input-&gt;keybit);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0__set_bit(EV_ABS, ts-&gt;input-&gt;evbit);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0__set_bit(EV_KEY, ts-&gt;input-&gt;evbit);<br>
<br>
</div></div>These 3 __set_bits() are not needed, the calls below will take =
care of<br>
setting needed bits.<br>
<div><div class=3D"h5"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Multitouch input params setup */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0input_set_abs_params(ts-&gt;input, ABS_MT_POSITIO=
N_X, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts-&gt;info.x_max, 0,=
 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0input_set_abs_params(ts-&gt;input, ABS_MT_POSITIO=
N_Y,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00, ts-&gt;info.y_max,=
 0, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0input_set_abs_params(ts-&gt;input, ABS_MT_TOUCH_M=
AJOR, 0, 255, 0, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0input_set_abs_params(ts-&gt;input, ABS_MT_PRESSUR=
E, 0, 255, 0, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0input_abs_set_res(ts-&gt;input, ABS_MT_POSITION_X=
, ts-&gt;info.x_res);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0input_abs_set_res(ts-&gt;input, ABS_MT_POSITION_Y=
, ts-&gt;info.y_res);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0input_set_drvdata(ts-&gt;input, ts);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D input_mt_init_slots(ts-&gt;input, MAX_T=
OUCH_NUM,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INPUT_MT_DIRECT | INP=
UT_MT_DROP_UNUSED);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;failed to initialize MT slots: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D input_register_device(ts-&gt;input);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;unable to register input device: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D devm_request_threaded_irq(&amp;client-&=
gt;dev, client-&gt;irq,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0NULL, raydium_i2c_irq, irqflags | IRQF_ONESHOT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0client-&gt;name, ts);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;Failed to register interrupt\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0device_init_wakeup(&amp;client-&gt;dev, true);<br=
>
<br>
</div></div>Please remove and rely on I2C core to enable wakeup for the dev=
ice.<br>
I know that is does not do that for ACPI-backed devices yet, but that is<br=
>
something that we need to change there, not in the driver.<br>
<div><div class=3D"h5"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D sysfs_create_group(&amp;client-&gt;dev.=
kobj, &amp;raydium_attribute_group);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev, &quot;failed to create sysfs attributes: %d\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D devm_add_action(&amp;client-&gt;dev,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raydium_i2c_remove_sysfs_group, ts);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raydium_i2c_remove_sy=
sfs_group(ts);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;Failed to add sysfs cleanup action: %d\n&quot;, error);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return error;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int raydium_i2c_remove(struct i2c_client *client)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct raydium_data *ts =3D i2c_get_clientdata(cl=
ient);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0input_unregister_device(ts-&gt;input);<br>
<br>
</div></div>This call is not needed.<br>
<span class=3D""><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0device_init_wakeup(&amp;client-&gt;dev, false);<b=
r>
<br>
</span>If we rely on platform/i2c core to set up wakeup flag we do not need=
 to<br>
reset it here.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mutex_destroy(&amp;ts-&gt;sysfs_mutex);<br>
<br>
This is not needed. Because nothing in raydium_i2c_remove() is needed<br>
you can remove to altogether.<br>
<div><div class=3D"h5"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void __maybe_unused raydium_enter_sleep(struct i2c_client *cli=
ent)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0static const u8 sleep_cmd[] =3D { 0x5A, 0xff, 0x0=
0, 0x0f };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int error;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0error =3D raydium_i2c_send(client, CMD_ENTER_SLEE=
P, (u8 *)sleep_cmd,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(sleep_cmd));<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0if (error)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(&amp;client-&=
gt;dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0&quot;Send sleep failed: %d\n&quot;, error);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int __maybe_unused raydium_i2c_suspend(struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_client *client =3D to_i2c_client(dev);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct raydium_data *ts =3D i2c_get_clientdata(cl=
ient);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Command not support in BLDR recovery mode */<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ts-&gt;boot_mode !=3D RAYDIUM_TS_MAIN)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EBUSY;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0disable_irq(client-&gt;irq);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (device_may_wakeup(dev)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raydium_enter_sleep(c=
lient);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ts-&gt;wake_irq_enabl=
ed =3D (enable_irq_wake(client-&gt;irq) =3D=3D 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raydium_i2c_power_off=
(ts);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int __maybe_unused raydium_i2c_resume(struct device *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct i2c_client *client =3D to_i2c_client(dev);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct raydium_data *ts =3D i2c_get_clientdata(cl=
ient);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (device_may_wakeup(dev)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ts-&gt;wake_irq_e=
nabled)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0disable_irq_wake(client-&gt;irq);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raydium_i2c_sw_reset(=
client);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raydium_i2c_power_on(=
ts);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raydium_i2c_initializ=
e(ts);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0enable_irq(client-&gt;irq);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static SIMPLE_DEV_PM_OPS(raydium_i2c_pm_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 raydium_i2c_suspend, raydium_i2c_resume);<br>
&gt; +<br>
&gt; +static const struct i2c_device_id raydium_i2c_id[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ DEVICE_NAME, 0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ }<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(i2c, raydium_i2c_id);<br>
&gt; +<br>
&gt; +#ifdef CONFIG_ACPI<br>
&gt; +static const struct acpi_device_id raydium_acpi_id[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ &quot;RAYD0001&quot;, 0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ }<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(acpi, raydium_acpi_id);<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +#ifdef CONFIG_OF<br>
&gt; +static const struct of_device_id raydium_of_match[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ .compatible =3D &quot;raydium,rm32380&quot;,},<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0{ /* sentinel */ }<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(of, raydium_of_match);<br>
&gt; +#endif<br>
&gt; +<br>
&gt; +static struct i2c_driver raydium_i2c_driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.probe =3D raydium_i2c_probe,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.remove =3D raydium_i2c_remove,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.id_table =3D raydium_i2c_id,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0.driver =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D &quot;raydi=
um_ts&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pm =3D &amp;raydium_=
i2c_pm_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.acpi_match_table =3D=
 ACPI_PTR(raydium_acpi_id),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.of_match_table =3D o=
f_match_ptr(raydium_of_match),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0},<br>
&gt; +};<br>
&gt; +<br>
&gt; +module_i2c_driver(raydium_i2c_driver);<br>
&gt; +<br>
&gt; +MODULE_AUTHOR(&quot;Raydium&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;Raydium I2c Touchscreen driver&quot;);<br>
&gt; +MODULE_LICENSE(&quot;GPL v2&quot;);<br>
&gt; --<br>
&gt; 2.1.2<br>
&gt;<br>
<br>
</div></div>Thanks.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Dmitry<br>
</font></span></blockquote></div><br></div>

--94eb2c089e587c07180531463749--
